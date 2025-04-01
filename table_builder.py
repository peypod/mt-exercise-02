import pandas as pd
import re

PATH_DICT = {
#"EPOCH_PATH" :"pytorch-examples/word_language_model/epoch_perplexity.txt",
"VALIDATION_PERP" :"epoch_perplexity.txt",
"TEST_PERP" :"final_perplexity.txt",
"TRAINING_PERP" :"single_perplexity.txt",
}

for key, path in PATH_DICT.items():

    with open(path, "r") as file:

        lines = file.readlines()
        # Split by Droput
        # Line up as columns
        # save as .csv

        data = {"Perplexity":[]}
        current_dropout = None
        column_buffer = []
        index = []
        index_flag = True

        for line in lines:
            match = re.match(r"Dropout (\d+\.\d+)", line)
            line_data = line.strip().split(", ")
            if match:
                if current_dropout is not None:
                    data[current_dropout] = column_buffer
                current_dropout = float(match.group(1))
                column_buffer = []
                if len(index) > 1:
                    index_flag = False
            else:
                column_buffer.append(line_data[-1])
                if index_flag:
                    index.append(line_data[0])
            if current_dropout is not None:
                data[current_dropout] = column_buffer

        data["Perplexity"] = index

        df = pd.DataFrame(dict([(k, pd.Series(v)) for k, v in data.items()]))
        #df.set_index("Perplexity")
        df.to_csv(f"{key}_TABLE.csv")

