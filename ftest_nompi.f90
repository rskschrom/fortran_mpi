program ftest
    use test_funcs
    implicit none

    integer :: i, comm, rank, numproc, ierr
    integer, parameter :: nval = 40
    real, dimension(nval) :: dum, avals

    ! loop through and set avals
    do i = 1, nval
        avals(i) = real(i)/real(nval)
    end do

    ! calculate dummy values
    do i = 1, nval
        dum(i) = dummy(avals(i))
        print *, dum(i)
    end do

    print *, dum

end program
