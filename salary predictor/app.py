import streamlit as st
import pandas as pd
import joblib
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
st.set_page_config(
    page_title="Salary Predictor",
    page_icon="💼",
    layout="centered"
)

@st.cache_resource
def load_model():
    model = joblib.load(os.path.join(BASE_DIR, 'salary_model.pkl'))
    encoders = joblib.load(os.path.join(BASE_DIR, 'encoders.pkl'))
    return model, encoders

@st.cache_data
def load_options():
    df = pd.read_csv(os.path.join(BASE_DIR, 'cleaned_jobs_salary.csv'))
    return df

df = load_options()

st.title("Tech Job Salary Predictor")
st.markdown("Fill in the job details below to get a predicted salary.")
st.divider()

col1, col2 = st.columns(2)

with col1:
    job_title = st.selectbox(
        "Job Title",
        sorted(df['job_title'].unique())
    )
    education_level = st.selectbox(
        "Education Level",
        sorted(df['education_level'].unique())
    )
    industry = st.selectbox(
        "Industry",
        sorted(df['industry'].unique())
    )
    company_size = st.selectbox(
        "Company Size",
        sorted(df['company_size'].unique())
    )

with col2:
    location = st.selectbox(
        "Location",
        sorted(df['location'].unique())
    )
    remote_work = st.selectbox(
        "Remote Work",
        sorted(df['remote_work'].unique())
    )
    experience_years = st.slider(
        "Years of Experience",
        min_value=0,
        max_value=20,
        value=5
    )
    skills_count = st.slider(
        "Number of Skills",
        min_value=1,
        max_value=20,
        value=5
    )

certifications = st.slider(
    "Number of Certifications",
    min_value=0,
    max_value=10,
    value=1
)

st.divider()

if st.button("Predict Salary", type="primary", use_container_width=True):

    cat_cols = ['job_title', 'education_level', 'industry',
                'company_size', 'location', 'remote_work']

    input_data = pd.DataFrame([{
        'job_title': job_title,
        'experience_years': experience_years,
        'education_level': education_level,
        'skills_count': skills_count,
        'industry': industry,
        'company_size': company_size,
        'location': location,
        'remote_work': remote_work,
        'certifications': certifications
    }])

    input_data = input_data[['job_title', 'experience_years', 'education_level',
                              'skills_count', 'industry', 'company_size',
                              'location', 'remote_work', 'certifications']]

    for col in cat_cols:
        input_data[col] = encoders[col].transform(input_data[col])

    prediction = model.predict(input_data)[0]

    st.success(f"### Predicted Salary: ${prediction:,.0f}")
    st.caption("Based on 250,000 job postings analyzed with a Random Forest model (R² = 0.969)")