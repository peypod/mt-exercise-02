

def read():

    #with open("mtg_cr.txt", encoding="UTF-8") as file:
    with open("mtg_cr_full.txt", encoding="UTF-8") as file:

        lines = file.read()

        splitted = [line for line in lines.splitlines() if line != ""]
        
        segments_splitted = [line for line in lines.split("\n\n") if line != ""]

        print(segments_splitted)

        print("count:", len(splitted))
        print("count:", len(segments_splitted))




read()
