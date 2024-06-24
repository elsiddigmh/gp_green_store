<?php

if (apcu_fetch('products')){
    $response['data'] = json_decode(apcu_fetch('products'));
    echo json_encode($response);
}