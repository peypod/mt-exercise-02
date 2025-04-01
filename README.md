# MT Exercise 2: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model). Thanks to Emma van den Bold, the original author of these scripts. 

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/marpng/mt-exercise-02
    cd mt-exercise-02

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh

-----

# Notes

We had to make changes to the shell scripts due to our machines being Windows. We also encountered some encoding errors, which were quickly resolved after consulting the Tutor. Aside from this, the exercise was a rewarding experience in training and profiling a language model with data of our choice.


## Preprocessing changes

* scripts/make_virtualenv.sh was modified to work on our Windows machines.

* we modified the preprocessing script into the file: scripts/download_data_new.sh
    Changes are simple like directory names or removal of downloading.


## Training changes
* scripts/train.sh was changed to use a for-loop for generating the models with different dropout rates. A seperate models is saved for each dropout rate.

* main.py (named PYTORCH_main.py, found in the root directory) includes the logging functionality. They are created within the same directory as main.py. 

* scripts/generate.sh was modified to take a model as a parameter.

* run tools/table_builder.py to generate .csv tables from log files. The filepaths are hardcoded within the script.
* run tools/plotter.py to plot the graphs of the tables.

# Run Instructions

* Download the Dune textfile () and place it in the folder: /dune/raw/dune_full.txt
* Run scripts/download_data_new.sh for the preprocessing
* Run scripts/train.sh to train models and generate log files
* Run scripts/generate.sh to generate samples of the model given as input
* Run table_builder.py to generate the table; run in the same directory as the log files (pytorch_examples/word_language_model/ by default)
* run plotter.py in the same directory as the generated .csv files to plot the perplexities.