cmake_minimum_required(VERSION 3.15)

project(cpp_project)

# Set c++ standard for all targets
set(CMAKE_CXX_STANDARD 20)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
# Find Botan early since the version affects subsequent compiler options
find_package(
    Botan 3.7.1
    REQUIRED
)

# Generate target 'botan_test' with specific modules
# Any Botan module can be listed here
botan_generate(
    botan_test
adler32
aead
aes
aes_ni
argon2
argon2_avx2
argon2_ssse3
argon2fmt
auto_rng
rng
system_rng
pem
sodium
sha1
sha1_armv8
sha1_sse2
sha1_x86
sha2_32
sha2_32_armv8
sha2_32_bmi2
sha2_32_x86
sha2_64
sha2_64_armv8
sha2_64_bmi2
sha3
skein
keccak
keccak_perm
keccak_perm_bmi2
whirlpool
blake2
blake2mac
blake2s
shake
gost_28147
gost_3410
gost_3411
sm2
sm3
sm4
threefish_512
twofish
streebog
rmd160
md4
md5
crc24
crc32
chacha
chacha20poly1305
chacha_avx2
chacha_avx512
chacha_rng
chacha_simd32
serpent
serpent_avx2
serpent_avx512
serpent_simd
ctr
eax
gcm
siv
)



add_subdirectory(src)

## Flags (Release is the default)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
