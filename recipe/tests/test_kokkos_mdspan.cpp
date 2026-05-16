#include <mdspan/mdspan.hpp>

#include <array>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> data = {1, 2, 3, 4, 5, 6};
    auto mapping = Kokkos::layout_stride::mapping<Kokkos::dextents<size_t, 2>>(
        Kokkos::dextents<size_t, 2>(2, 3),
        std::array<size_t, 2>{3, 1});
    Kokkos::mdspan<int, Kokkos::dextents<size_t, 2>, Kokkos::layout_stride> matrix(
        data.data(),
        mapping);

    if (matrix(0, 0) != 1 || matrix(1, 2) != 6) {
        std::cerr << "Kokkos mdspan test failed!" << std::endl;
        return 1;
    }

    std::cout << "Kokkos mdspan test passed!" << std::endl;
    return 0;
}
