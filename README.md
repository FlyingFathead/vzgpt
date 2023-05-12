# vzgpt (Viznut's GPT-2 implementation)

See the original version at https://github.com/viznut/vzgpt

In this fork:

- added deployment scripts for Ubuntu 22.04LTS
- => fixed `Makefile` to include Lua5.2 + SDL1.2 libraries on Ubuntu/Debian systems
- => added a script `ubuntu_22_04_apt_install.sh` for necessary apt installs
- => added `requirements.txt` for `tensorflow`
- included prebuilt Linux binary, `vzgpt` (x86_64 / amd64)

This is Viznut's C-only implementation of GPT-2 inference, mostly intended for 
personal learning and toying. GPT-2 is the neural language model developed at
OpenAI.

Features:
- CPU-only calculation one token at a time.
- Automatic 16-bit quantization of the bulk of the parameters to save memory.
- Packed mmap()able single-file model format to speed up loading.
- Multithreading supported via pthreads.
- Commandline UI to generate text from a given prompt.
- Terminal and SDL UIs to run the network more interactively.

A video showing off the SDL UI is at
https://www.youtube.com/watch?v=iw2xOVF61tA

In order to run, you need a GPT-2 model dumped into separate raw files under
a single directory. The script dumpckpt.py dumps a model released by OpenAI
into this format. Use the downloader script download_model.py at
https://github.com/openai/gpt-2/ to download them.

Edit config.h to make the hardcoded network parameters match the model you
use. Alternatively, you can define CONSTS_AS_VARS to support all the
different parameter sets with the same executable (but this is still
slightly buggy).

The Makefile uses GCC on a Unix/Linux-type system. If you don't want SDL,
threading etc., you can disable those parts by editing config.h.

Image-GPT models are also technically supported but there's still bughunting
to do before they work properly.

TODO:
- Same stuff as in the original
