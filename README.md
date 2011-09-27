# Tcl Stubs (Tables)

This project contains a set of (pure) Tcl packages for the handling of
Tcl stubs table declarations. They provide functionality to:

 *  Parse stubs declarations (*.decls* files).
 *  Represent stubs tables as Tcl objects (containers).
 *  Generate a variety of C code from stubs tables.

Historically speaking we have the **genStubs.tcl** application
distributed with the Tcl core itself. The packages here are, in
essence, (nearly) the same code, *just* sliced and diced into packages
for easier reuse in other contexts which have to handle Tcl stubs
tables. Like, for example, Jean-Claude Wippler's **critcl**
application and package.

For more information about the history and concepts behind Tcl's stub
tables please read the package's documentation.

# Installing the packages

 *  The toplevel directory contains a Tcl script **build.tcl** for
    installing the packages (and adjunct application).

 * to install the packages simply run:

    ```% ./build.tcl install```

    This installs the packages in the **[info library]** directory of
    the **tclsh** found in PATH and used to run build.tcl.

    Explicitly using a specific **tclsh**, like

    ```% /path/to/tclsh ./build.tcl install```

    will install the packages in the **[info library]** directory of
    that shell.

    Explicitly using a specific installation directory, like

    ```% ./build.tcl install /path/to/chosen/package/directory/```

    will install all the packages there.

 *  To get online help, run

    ```% ./build.tcl help```

# Documentation

 *  The source of the reference manpages for the packages can be
    found in the sub-directory "doc/", with various (shared) text blocks
    under "doc/include/". They are written using 'doctools' markup (See
    Tcllib's doctools packages). The files match the pattern
    "doc/\*.man", and "doc/include/\*.inc".

 *  The files matching the pattern "doc/include/\*.dia" are diagram
    specifications using the 'dia' markup language (See Tklib's diagram
    packages). The files matching the pattern "doc/include/\*.png" are
    the diagrams saved as raster images in the PNG format.

    This was done with the **dia** application found in Tklib.

 *  The directory "embedded/" contains the reference manpages in nroff
    and HTML formats, derived from the doctools sources under "doc/".

    The script used to (re)generate these files is "tools/makedoc.sh".
    It requires the **dtplite** application found in Tcllib.
