#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/gruntwork-io/terragrunt/releases/download
APP=terragrunt

dl()
{
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local suffix=${5:-}
    local platform="${os}_${arch}"
    local file=${APP}_${platform}${suffix}
    local url=$MIRROR/$ver/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `fgrep $file $lchecksums | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    local lchecksums=$DIR/${APP}_${ver}_checksums.txt
    local rchecksums=$MIRROR/$ver/SHA256SUMS
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $rchecksums
    fi
    printf "  # %s\n" $rchecksums
    printf "  %s:\n" $ver


    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums darwin arm64
    dl $ver $lchecksums linux 386
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums linux arm64
    dl $ver $lchecksums windows 386 .exe
    dl $ver $lchecksums windows amd64 .exe
}

dl_ver ${1:-v0.67.9}
