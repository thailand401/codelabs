<?php

	$output = shell_exec('sudo '.getcwd()."/builder_cmd.sh 2>&1");
	var_dump($output);

?>