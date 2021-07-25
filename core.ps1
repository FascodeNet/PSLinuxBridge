remove-item alias:ls
function ls(){
    $l_o=0
    $a_o=0
    $dirlist=@()
    if ( $args.length -ne 0 ) {
        foreach ( $opt in $args){
            if( $opt[0] -eq "-" ){
                for( $j=1; $j -lt $opt.length; $j++){
                    switch ( $opt[$j] ){
                        l{$l_o=1}
                        a{$a_o=1}
                    }
                }
            } else {
                $dirlist += $opt
            }
        }
    }
    if( $l_o -eq 1){
        if($a_o -eq 1){
            Get-ChildItem -Force $dirlist
        }else{
            Get-ChildItem $dirlist
        }
    }else{
        if($a_o -eq 1){
            Get-ChildItem -Force -Name $dirlist
        }else{
            Get-ChildItem -Name $dirlist
        }
    }
}
remove-item alias:rm
function rm(){
    $r_o=0
    $f_o=0
    $dirlist=@()
    if ( $args.length -ne 0 ) {
        foreach ( $opt in $args){
            if( $opt[0] -eq "-" ){
                for( $j=1; $j -lt $opt.length; $j++){
                    switch ( $opt[$j] ){
                        r{$r_o=1}
                        f{$f_o=1}
                    }
                }
            } else {
                $dirlist += $opt
            }
        }
    }
    if( $r_o -eq 1){
        if($f_o -eq 1){
            Remove-Item -Recurse -Force $dirlist
        }else{
            Remove-Item -Recurse $dirlist
        }
    }else{
        if($f_o -eq 1){
            Remove-Item -Force $dirlist
        }else{
            
            Remove-Item $dirlist
        }
    }
}