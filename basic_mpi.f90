program basic_mpi
    use mpi
    use test_funcs
    implicit none

    integer :: i, comm, rank, numproc, ierr
    real :: a, b

    ! start parallel portion of code
    call MPI_INIT(ierr)

    ! get processor number
    call MPI_COMM_RANK(MPI_COMM_WORLD,rank,ierr)

    ! get total number of processes
    call MPI_COMM_SIZE(MPI_COMM_WORLD,numproc,ierr)

    print *, 'hi yall!', rank, numproc
    !print *, get_prime(3)

    ! end parallel portion of code
    call MPI_FINALIZE(ierr)

end program
