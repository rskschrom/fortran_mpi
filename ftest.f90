program ftest
    use mpi
    use test_funcs
    implicit none

    integer :: i, comm, rank, numproc, ierr
    integer, parameter :: nval = 200
    real, dimension(nval) :: dum, avals

    ! start parallel portion of code
    call MPI_INIT(ierr)

    ! get processor number
    call MPI_COMM_RANK(MPI_COMM_WORLD,rank,ierr)

    ! get total number of processes
    call MPI_COMM_SIZE(MPI_COMM_WORLD,numproc,ierr)

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

    ! end parallel portion of code
    call MPI_FINALIZE(ierr)

end program
