<?php

if (apcu_fetch('categories')){
    echo apcu_fetch('categories');
}