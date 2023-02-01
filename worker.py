import concurrent.futures as cf
from tqdm import tqdm
import os
import time

class CalculatePI(object):
    """Calculate the value of π by multi process

    Args:
        num_iterations (int): Number of iterations. Default: 100000
        max_workers (int): Maximum number of processes. Default: the number of processors on the machine.
    """

    def __init__(self, num_iterations: int = 100000, max_workers: int = os.cpu_count()) -> None:
        """Initialization

        Args:
            num_iterations (int): Number of iterations. Default: 100000
            max_workers (int): Maximum number of processes. Default: the number of processors on the machine.
        """
        self.num_iterations = num_iterations
        self.max_workers = max_workers

    def __calc__(self, start: int, end: int) -> float:
        """Calculate the value of π according to formula

        Args:
            start (int): Starting value for the iterations
            end (int): Ending value for the iterations

        Returns:
            float: Value of π
        """
        PI = 0
        for n in tqdm(range(start, end)):
            PI += 1/pow(16, n) * (4/(8*n+1) - 2 / (8*n+4) - 1/(8*n+5) - 1/(8*n+6))
        return PI

    def __main__(self) -> float:
        """Calulate the value of π by multi process

        Returns:
            float: Value of π
        """
        PI = 0
        with cf.ProcessPoolExecutor(self.max_workers) as p:
            futures = []
            for i in range(self.max_workers):
                start = i*self.num_iterations//self.max_workers
                end = (i+1)*self.num_iterations//self.max_workers
                futures.append(p.submit(self.__calc__, start, end))
            for future in cf.as_completed(futures):
                PI += future.result()
        return PI


if __name__ == '__main__':
    while True:
        print(CalculatePI().__main__())
        time.sleep(1)

