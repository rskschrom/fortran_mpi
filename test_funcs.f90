module test_funcs
    contains

    ! get nth prime number
    function get_prime(n)

        integer :: n, get_prime, prime_cnt, test_int, i
   
        test_int = 1

        ! loop through until we get the nth prime
        prime_cnt = 0
        do while (prime_cnt.lt.n)
            test_int = test_int+1

            ! test if test_int is prime
            if (num_divisible(test_int).eq.2) then
                get_prime = test_int
                prime_cnt = prime_cnt+1
            end if

        end do

    end function

    ! get number of integers n is divisible by
    function num_divisible(n)

        integer :: n, num_divisible, i
        real :: div_num

        num_divisible = 0
        rsmall = tiny(2.0)

        do i = 1, n
            div_num = float(n)/float(i)
            if ((div_num-float(int(div_num))).le.rsmall) then
                num_divisible = num_divisible+1
            end if
        end do
        return

    end function

    ! slow dummy function
    function dummy(a)

        integer :: i
        real :: dummy, a, b

        b = 0.1
        do i = 1, 14731524
            b = sin(a+b)
        end do

        dummy = b

        return

    end function

end module
