trinitycore-docker-collection
=============================

This project is a collection of docker file intended to build [trinity-core](https://github.com/TrinityCore/TrinityCore)

This project is not affiliated with trinity-core and is provided as-is.

The current image are not optimized as the whole source code is kept (for rebuild / debugging purpose) inside the final image.

Build Status
-------

| Version      | Commit                                                                                                                               | Build | Remarks       |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------|:-----:|---------------|
| 10.2.0.52808 | [5cc1b97fc1430f07d8942ae9f87fd5ad9708db59](https://github.com/TrinityCore/TrinityCore/tree/5cc1b97fc1430f07d8942ae9f87fd5ad9708db59) |  ✔️    |               |
| 10.1.7.51313 | [71f2f52303bc55f64301260e8810b4b9153f6a37](https://github.com/TrinityCore/TrinityCore/tree/71f2f52303bc55f64301260e8810b4b9153f6a37) |  ✔️    |               |
| 10.0.7.49267 | [f540477fed7a03f4615b818482cd7b4a47759222](https://github.com/TrinityCore/TrinityCore/tree/f540477fed7a03f4615b818482cd7b4a47759222) |  ✔️    |               |
| 10.0.5.48526 | [356c0c8afc62190c272e87d35819b0ab38ebe96f](https://github.com/TrinityCore/TrinityCore/tree/356c0c8afc62190c272e87d35819b0ab38ebe96f) |  ✔️    |               |
| 10.0.2.47213 | [731217703819c26645944091f47aec63b45c25d4](https://github.com/TrinityCore/TrinityCore/tree/731217703819c26645944091f47aec63b45c25d4) |  ✔️    |               |
| 9.2.7.45161  | [0eff4ec7df6d34db28e09582f3e2a257bc7d35b0](https://github.com/TrinityCore/TrinityCore/tree/0eff4ec7df6d34db28e09582f3e2a257bc7d35b0) |  ✔️    |               |
| 9.2.0.42560  | [c19863745addec42cf8e1cd77f3daf10fa25ae16](https://github.com/TrinityCore/TrinityCore/tree/c19863745addec42cf8e1cd77f3daf10fa25ae16) |  ✔️    |               |
| 9.1.5.42010  | [f96c8cc39ba15d7c9f0784428b9bbcbca4665370](https://github.com/TrinityCore/TrinityCore/tree/f96c8cc39ba15d7c9f0784428b9bbcbca4665370) |  ✔️    |               |
| 9.1.5.41488  | [7bc3a92b2c7f546408edd32beb2c5cabdda6616b](https://github.com/TrinityCore/TrinityCore/tree/7bc3a92b2c7f546408edd32beb2c5cabdda6616b) |  ✔️    |               |
| 8.3.7.35662  | [f4b4425862dab8ea743d9fa52097f7d742984a59](https://github.com/TrinityCore/TrinityCore/tree/f4b4425862dab8ea743d9fa52097f7d742984a59) |  ✔️    |               |
| 7.3.5.26124  | [31f6ba5a92b0f88f328e0e6adcf33bd4820599c2](https://github.com/TrinityCore/TrinityCore/tree/31f6ba5a92b0f88f328e0e6adcf33bd4820599c2) |  ❌️   | Openssl Error |

Public images
--------------

| Version       |  Image                                                    |
| ------------- |  -------------------------------------------------------- |
| 10.2.0.52808  | `docker-public.servme.fr/servme/trinitycore:10.2.0.52808` |
| 10.1.7.51313  | `docker-public.servme.fr/servme/trinitycore:10.1.7.51313` |
| 10.0.7.49267  | `docker-public.servme.fr/servme/trinitycore:10.0.7.49267` |
| 10.0.5.48526  | `docker-public.servme.fr/servme/trinitycore:10.0.5.48526` |
| 10.0.2.47213  | `docker-public.servme.fr/servme/trinitycore:10.0.2.47213` |
| 9.2.7.45161   | `docker-public.servme.fr/servme/trinitycore:9.2.7.45161`  |
| 9.2.0.42560   | `docker-public.servme.fr/servme/trinitycore:9.2.0.42560`  |
| 9.1.5.42010   | `docker-public.servme.fr/servme/trinitycore:9.1.5.42010`  |
| 9.1.5.41488   | `docker-public.servme.fr/servme/trinitycore:9.1.5.41488`  |
| 8.3.7.35662   | `docker-public.servme.fr/servme/trinitycore:8.3.7.35662`  |

Running the images
-------------------

The code compiled and installed to the target directory `/opt/trinitycore`

Sample compose file are provided inside the version directory
