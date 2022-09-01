trinitycore-docker-collection
=============================

This project is a collection of docker file intended to build [trinity-core](https://github.com/TrinityCore/TrinityCore)

This project is not affiliated with trinity-core and is provided as-is.

The current image are not optimized as the whole source code is keept (for rebuild / debugging purpose) inside the final image.

Build Status
-------

| Version       | Commit                                                                                                                               | Status | Remarks       |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ------ |---------------|
| 9.2.7.45161   | [0eff4ec7df6d34db28e09582f3e2a257bc7d35b0](https://github.com/TrinityCore/TrinityCore/tree/0eff4ec7df6d34db28e09582f3e2a257bc7d35b0) |   ✔️   |               |
| 9.2.0.42560   | [c19863745addec42cf8e1cd77f3daf10fa25ae16](https://github.com/TrinityCore/TrinityCore/tree/c19863745addec42cf8e1cd77f3daf10fa25ae16) |   ✔️   |               |
| 9.1.5.41488   | [c5d3bd2cdd8f5ccf0d458fd9a97f315d87c1113a](https://github.com/TrinityCore/TrinityCore/tree/c5d3bd2cdd8f5ccf0d458fd9a97f315d87c1113a) |   ✔️   |               |
| 8.3.7.35662   | [f4b4425862dab8ea743d9fa52097f7d742984a59](https://github.com/TrinityCore/TrinityCore/tree/f4b4425862dab8ea743d9fa52097f7d742984a59) |   ✔️   |               |
| 7.3.5.26124   | [31f6ba5a92b0f88f328e0e6adcf33bd4820599c2](https://github.com/TrinityCore/TrinityCore/tree/31f6ba5a92b0f88f328e0e6adcf33bd4820599c2) |   ❌️    | Openssl Error |

Public images
--------------

| Version       |  Image                                                   |
| ------------- |  ------------------------------------------------------- |
| 9.2.7.45161   | `docker-public.servme.fr/servme/trinitycore:9.2.7.45161` |
| 9.2.0.42560   | `docker-public.servme.fr/servme/trinitycore:9.2.0.42560` |
| 9.1.5.41488   | `docker-public.servme.fr/servme/trinitycore:9.1.5.41488` |
| 8.3.7.35662   | `docker-public.servme.fr/servme/trinitycore:8.3.7.35662` |

Running the images
-------------------

The code compiled and installed to the target directory `/opt/trinitycore`

Sample compose file are provided inside the version directory
