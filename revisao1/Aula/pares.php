<?php


for($i = 0; $i < 100; $i++){

    if($i % 2 == 1){
        continue;
    }

    echo $i . "\n";
}