<?php

class Engine {
    public function createMain($name, $src, $des){
        var_dump( $src.$name.'.tpl' );
        $src_file = fopen($src.$name.'.tpl', "r") or die("Unable to open $name template file!");
        $tmp = fread($src_file,filesize($src.$name.'.tpl'));
        file_put_contents($des.$name, $tmp);
        fclose($src_file);
    }
    public function createConfig($name, $src, $des, $data, $static = ''){
        $src_file = fopen($src.$name.'.tpl', "r") or die("Unable to open $name template file!");
        $tmp = fread($src_file,filesize($src.$name.'.tpl'));

        foreach ($data as $bloc => $dt) {
            $block = '$BLOC_'.$bloc.'_$';
            $str_data = '';
            foreach ($dt as $key => $value) {
                if($value[0] == 'String'){
                    $str_data .= $static.$value[0].' '.$key.'="'.$value[1].'";';
                }else {
                    $str_data .= $static.$value[0].' '.$key.'='.$value[1].';';
                }
            }
            $tmp = str_replace($block, $str_data, $tmp);
        }
        
        file_put_contents($des.$name, $tmp);
        fclose($src_file);
    }
}

$source = 'template/';
$destinate = '/var/www/Flutter/webapp/lib/';
$engine = new Engine();

$input = [
    'welcome' => 'Web app automatic success!',
    'logo' => 'img/logo.png',
];

$config_data = [
    'B1' => [
        'main_color' => ['Color', 'Colors.blue'],
        'second_color' => ['Color', 'Colors.red'],
        'welcome' => ['String', $input['welcome']],
        'logo' => ['String', $input['logo']],
    ]
];

$config_name = 'theme.dart';
$config_templt = $source.'config/';
$config_output = $destinate;
$engine->createConfig($config_name ,$config_templt, $config_output, $config_data, 'static const ');
$engine->createMain('main.dart',$source, $destinate);

?>