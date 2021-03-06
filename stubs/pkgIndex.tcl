if {![package vsatisfies [package provide Tcl] 8.4]} {return}
#checker -scope global exclude warnUndefinedVar

# Global package, bundles everything.
package ifneeded stubs 1 [list source [file join $dir stubs.tcl]]

# The various pieces (import, storage, and export (code generation)).
package ifneeded stubs::container   1 [list source [file join $dir container.tcl]]
package ifneeded stubs::reader      1 [list source [file join $dir reader.tcl]]
package ifneeded stubs::writer      1 [list source [file join $dir writer.tcl]]
package ifneeded stubs::gen         1 [list source [file join $dir genframe.tcl]]
package ifneeded stubs::gen::init   1 [list source [file join $dir gen_init.tcl]]
package ifneeded stubs::gen::stubs  1 [list source [file join $dir gen_stubs.tcl]]
package ifneeded stubs::gen::header 1 [list source [file join $dir gen_header.tcl]]
package ifneeded stubs::gen::decl   1 [list source [file join $dir gen_decl.tcl]]
package ifneeded stubs::gen::macro  1 [list source [file join $dir gen_macro.tcl]]
package ifneeded stubs::gen::slot   1 [list source [file join $dir gen_slot.tcl]]
package ifneeded stubs::gen::lib    1 [list source [file join $dir gen_lib.tcl]]
