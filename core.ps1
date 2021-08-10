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
remove-item alias:cp
function cp(){
    $r_o=0
    $f_o=0
    $srclist=@()
    $src=""
    $dest=""
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
                $srclist += $opt
            }
        }
    }
    $dest=$srclist[-1]
    $srclist=$srclist[0..($srclist.length-2)]
    for($i=0;$i -lt $srclist.length;$i++){
        if($i -eq $srclist.length-1){
            $src=$src + $srclist[$i]
        }else{
            $src=$src + $srclist[$i] + ","
        }
    }
    if( $r_o -eq 1){
        if($f_o -eq 1){
            Copy-Item -Recurse -Force $srclist -Destination $dest
        }else{
            Copy-Item -Recurse  $srclist -Destination $dest
        }
    }else{
        if($f_o -eq 1){
            Copy-Item -Force $srclist -Destination $dest
        }else{
            
            Copy-Item $srclist -Destination $dest
        }
    }
}