program ftest
    use mpi
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

    ! open mpi commands
    !$omp parallel private(i) shared(avals,dum)
    !$omp do
    do i = 1, nval
        dum(i) = dummy(avals(i))
        print *, dum(i)
    end do
    !$omp end do
    !$omp end parallel

    print *, dum

end program
