using PlotlyJS
using CSV, DataFrames

# Use julia -i df_plotly.jl command to run the script interactively
df = dataset(DataFrame, "tips")
example_plot = plot(df, y = :tip, facet_row = :sex, facet_col = :smoker, 
                    color = :day, kind = "violin")
display(example_plot)