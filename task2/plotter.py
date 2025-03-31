import matplotlib.pyplot as plt
import pandas as pd


PATH_DICT = [

"VALIDATION_PERP",
"TRAINING_PERP",
#"TEST_PATH",
]

#ax, plot = plt.subplots(1, 3)
fig, axes = plt.subplots(nrows=1, ncols=2)


path = "VALIDATION_PERP"

fpath = f"VALIDATION_PERP_TABLE.csv"
df = pd.read_csv(fpath, index_col= "Unnamed: 0")
lineplot1 = df.plot(ax=axes[0], title=path, kind="line")


path = "TRAINING_PERP"

fpath = f"TRAINING_PERP_TABLE.csv"
df = pd.read_csv(fpath, index_col= "Unnamed: 0")
df = df.drop(columns=["Perplexity"])

lineplot2 = df.plot(ax=axes[1], title=path, kind="line", logy=True)

plt.show()