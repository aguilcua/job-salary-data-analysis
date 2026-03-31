import pandas as pd

df = pd.read_csv("job_salary_prediction_dataset.csv")

#data clean
df.dropna(inplace=True) #drop columns with missing values - inplace modify the current df
df.to_csv("cleaned_jobs_salary.csv", index=False)

