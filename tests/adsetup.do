
 local clone "C:\Users\wb462869\github\adodown-stata"
 
 local ado   "`clone'/ado"
 local tests "`clone'/tests"
 local adsetup_out "`tests'/outputs/adosetup"

    cap which ietoolkit
   if _rc == 111 {
       ssc install ietoolkit, replace
   }
 
 ieboilstart, version(15) adopath("`tests'/testado", strict)
 
    cap which ietoolkit
   if _rc == 111 {
       ssc install ietoolkit, replace
   }

 run "`tests'/test_utils.do"
 
 net describe adodown , from("`clone'") 
 net install  adodown , from("`clone'") replace all
 //net get      adodown , from("`clone'") replace all

 
 
 
 local fld_pkg_yesconfirm "`adsetup_out'/pkg-yesconfirm"
 ie_recurse_rmdir, folder("`fld_pkg_yesconfirm'") okifnotexist
 mkdir "`fld_pkg_yesconfirm'"
 adsetup, folder("`fld_pkg_yesconfirm'") yesconfirm ///
    author("Kristoffer Bjarkefur")  ///
    name("yesconfirm")  ///
    description("My awesome Stata tool")  ///
    url("https://github.com/kbjarkefur/adodown-stata") ///
    contact("kbjarkefur@worldbank.org")
    
//  local fld_pkg_allsyntax "`adsetup_out'/pkg-allsyntax"
//  ie_recurse_rmdir, folder("`fld_pkg_allsyntax'") okifnotexist
//  mkdir "`fld_pkg_allsyntax'"
//  adsetup, folder("`fld_pkg_allsyntax'")  ///
//     author("Kristoffer Bjarkefur")  ///
//     name("allsyntax")  ///
//     description("My awesome Stata tool")  ///
//     url("https://github.com/kbjarkefur/adodown-stata")  
 
//  local fld_pkg_manual "`adsetup_out'/pkg-manual" 
//  ie_recurse_rmdir, folder("`fld_pkg_manual'") okifnotexist
//  mkdir "`fld_pkg_manual'"
//  adsetup, folder("`fld_pkg_manual'")