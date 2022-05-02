# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/LeaC0d3s/mt-exercise-3.git
    cd mt-exercise-3
    
If you encounter an error-message, because you don't have permission to run the scripts in the repo. etc., I recommend trying the following first befor running the scripts:

	cd scripts
	chmod u+x *.sh
	chmod u+x *.py
	cd ..

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.


Download and install required software:

    ./scripts/install_packages.sh

Download my own Dataset (Emma by Jane Austen from the Project Gutenberg website) and preprocess it:

    ./scripts/download_data_custom.sh

Train a model: (set default dropout for demonstration to 0.5)

    ./scripts/train_custom.sh

Adjust dropout parameters in train_custom.sh manually to reproduce the chart/table perplexity scores and models:

    - --dropout 0 , --save $models/model0.pt
    - --dropout 0.3 , --save $models/model0_3.pt
    - --dropout 0.5 , --save $models/model0_5.pt (Best Model --> used for generating sample text)
    - --dropout 0.6 , --save $models/model0_6.pt
    - --dropout 0.9 , --save $models/model0_9.pt
   
The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from the best trained model (0.5 dropout) with:
   
    ./scripts/generate_custom.sh

**Important**: If you want enter a custom input string for the word generation sample, follow the following steps:

Go to the repository:
	https://github.com/LeaC0d3s/mt_task3_examples.git
	
- Copy the generate.py file from the mt_task3_examples/word_language_model/generate.py
- replace the current generate.py file (mt-exercise-3/tools/pytorch-examples/word_language_model/generate.py) with the new generate.py file from the mt_task3_examples repository
- After you replaced the old with the new generate.py file --> Test custom inputs on your trained model with the following script:

Sample Inputs for word generation:

	./scripts/generate_custom_task3.sh

