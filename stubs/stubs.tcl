# -*- tcl -*-
# STUBS handling -- Global bundle of everything
#
# (c) 2011 Andreas Kupries http://wiki.tcl.tk/andreas%20kupries

package require stubs::container   
package require stubs::reader      
package require stubs::writer      
package require stubs::gen         
package require stubs::gen::init   
package require stubs::gen::stubs  
package require stubs::gen::header 
package require stubs::gen::decl   
package require stubs::gen::macro  
package require stubs::gen::slot   
package require stubs::gen::lib    

# # ## ### #####
package provide stubs 1
return
