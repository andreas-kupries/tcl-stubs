#!/bin/sh
# -*- tcl -*- \
exec tclsh "$0" ${1+"$@"}
set me    [file normalize [info script]]
set mydir [file dirname $me]
proc main {} {
    global argv
    if {![llength $argv]} { set argv help}
    if {[catch {
	eval _$argv
    }]} usage
    exit 0
}
proc usage {{status 1}} {
    global errorInfo
    if {($errorInfo ne {}) &&
	![string match {invalid command name "_*"*} $errorInfo]
    } {
	puts stderr $::errorInfo
	exit
    }

    global argv0
    set prefix "Usage: "
    foreach c [lsort -dict [info commands _*]] {
	set c [string range $c 1 end]
	if {[catch {
	    H${c}
	} res]} {
	    puts stderr "$prefix$argv0 $c args...\n"
	} else {
	    puts stderr "$prefix$argv0 $c $res\n"
	}
	set prefix "       "
    }
    exit $status
}
proc +x {path} {
    catch { file attributes $path -permissions u+x }
    return
}
proc grep {file pattern} {
    set lines [split [read [set chan [open $file r]]] \n]
    close $chan
    return [lsearch -all -inline -glob $lines $pattern]
}
proc version {file} {
    set provisions [grep $file {*package provide*}]
    #puts /$provisions/
    return [lindex $provisions 0 3]
}
proc Hhelp {} { return "\n\tPrint this help" }
proc _help {} {
    usage 0
    return
}
proc Hrecipes {} { return "\n\tList all brew commands, without details." }
proc _recipes {} {
    set r {}
    foreach c [info commands _*] {
	lappend r [string range $c 1 end]
    }
    puts [lsort -dict $r]
    return
}
proc Hinstall {} { return "?destination?\n\tInstall all packages.\n\tdestination = path of package directory, default \[info library\]." }
proc _install {{dst {}}} {
    global mydir
    set version  [version $mydir/stubs/stubs.tcl]

    if {[llength [info level 0]] < 2} {
	set dstl [info library]
	set dsta [file dirname [file normalize [info nameofexecutable]]]
    } else {
	set dstl $dst
	set dsta [file dirname $dst]/bin
    }

    # Packages

    file copy   -force $mydir/stubs        $dstl/stubs-new
    file delete -force $dstl/stubs$version
    file rename        $dstl/stubs-new     $dstl/stubs$version

    puts "Installed package:     $dstl/stubs$version"

    return
}
main
