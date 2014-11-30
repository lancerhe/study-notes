```php
while(TRUE) {
    sleep(1);
    if( -1 === ( $pid = pcntl_fork() ) ){
        throw new Exception(' couldn\'t fork.');
    } 

    if ( $pid ) {
        echo "Memory:".memory_get_usage()."; Father". PHP_EOL;
        $status = 0;
        pcntl_wait( $status );
    } else {

        if ( -1 === ($ppid = pcntl_fork() ) ) {
            throw new Exception(' couldn\'t fork.');
        } else {
            if ( $ppid ) {
                $status = 0;
                $status = pcntl_wait($status,1);
                posix_kill(getmypid(), SIGTERM);
            } else {
                echo "Memory:".memory_get_usage()."; Sun Process Id:" . getmypid() . PHP_EOL;
                exit();
            }
        }
    }
}
```