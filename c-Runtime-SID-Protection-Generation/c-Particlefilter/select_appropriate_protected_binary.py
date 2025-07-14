import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
import os, sys
from sklearn.utils import shuffle
from sklearn.feature_selection import mutual_info_regression
import joblib
import time


train_file_path = sys.argv[1]  
test_file_path = sys.argv[2]  
want_to_use_trained_model = int(sys.argv[3])

os.system("rm -r protected-binary-* log_model_output.txt model_prediction.csv")

output_log_filepath = "log_model_output.txt"
output_log_file = open(output_log_filepath, "w")


df_train = pd.read_csv(train_file_path, header=None, names=["input", "SDC Rate"])
df_test = pd.read_csv(test_file_path, header=None, names=["input", "SDC Rate"])


df_train[["arg1", "arg2", "arg3", "arg4", "arg5", "arg6", "arg7", "arg8"]] = df_train["input"].str.replace('"', '').str.split(" ", expand=True)
df_test[["arg1", "arg2", "arg3", "arg4", "arg5", "arg6", "arg7", "arg8"]] = df_test["input"].str.replace('"', '').str.split(" ", expand=True)
df_train[["arg2", "arg4", "arg6", "arg8"]] = df_train[["arg2", "arg4", "arg6", "arg8"]].astype(int)
df_test[["arg2", "arg4", "arg6", "arg8"]] = df_test[["arg2", "arg4", "arg6", "arg8"]].astype(int)

df_train.drop(columns=["input", "arg1", "arg3", "arg5", "arg7"], inplace=True)
df_test.drop(columns=["input", "arg1", "arg3", "arg5", "arg7"], inplace=True)


def feature_engineering(df):
    df["arg2%2"] = df["arg2"] % 2
    df["arg4%2"] = df["arg4"] % 2
    df["arg6%2"] = df["arg6"] % 2
    df["arg8%2"] = df["arg8"] % 2
    df["log(arg2*arg4*arg6)"] = np.log1p(df["arg2"] * df["arg4"] * df["arg6"])  # Interaction term
    df["log(arg2+arg4+arg6)"] = np.log1p(df["arg2"] + df["arg4"] + df["arg6"])
    df["log(arg2*arg4*6)/log(arg8)"] = np.log1p(df["arg2"] * df["arg4"] * df["arg6"]) / np.log1p(df["arg8"])
    df["min(arg2 arg4 arg6 arg8)"] = df[["arg2", "arg4", "arg6", "arg8"]].min(axis=1)
    df["max(arg2 arg4 arg6 arg8)"] = df[["arg2", "arg4", "arg6", "arg8"]].max(axis=1)
    df["arg2^2"] = np.log1p(df["arg2"] ** 2)
    df["arg4^2"] = np.log1p(df["arg4"] ** 2)
    df["arg6^2"] = np.log1p(df["arg6"] ** 2)
    df["arg8^2"] = np.log1p(df["arg8"] ** 2)
    df["log(arg2)"] = np.log1p(df["arg2"])
    df["log(arg4)"] = np.log1p(df["arg4"])
    df["log(arg6)"] = np.log1p(df["arg6"])
    df["log(arg8)"] = np.log1p(df["arg8"])
   
    return df

df_train = feature_engineering(df_train)
df_test = feature_engineering(df_test)

df_train = shuffle(df_train, random_state=42)

# Define features and target variable
X_train = df_train.drop(columns=["SDC Rate"])
X_test = df_test.drop(columns=["SDC Rate"])
y_train = df_train["SDC Rate"]
y_test = df_test["SDC Rate"]

# Feature Selection using Mutual Information
mi_scores = mutual_info_regression(X_train, y_train, random_state=42)
mi_scores_df = pd.DataFrame({
    "Feature": X_train.columns,
    "MI Score": mi_scores
})
mi_scores_df = mi_scores_df.sort_values(by="MI Score", ascending=False)
selected_features = mi_scores_df["Feature"].head(5).tolist()


X_train_selected = X_train[selected_features]
X_test_selected = X_test[selected_features]

output_log_file.write("Final X_train shape: {}\n".format(X_train_selected.shape))
output_log_file.write("Final X_test shape: {}\n".format(X_test_selected.shape))

# Standardize the selected features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train_selected)
X_test_scaled = scaler.transform(X_test_selected)

# Check if a pretrained model exists
model_filename = "trained_model.joblib"
if os.path.exists(model_filename) and want_to_use_trained_model == 1:
    print("Loading the pretrained model...")
    nn_model = joblib.load(model_filename)
    train_duration = 0.0
else:
    print("Training a new model...")
    start_train_time = time.time()
    nn_model = MLPRegressor(
        hidden_layer_sizes=(512, 256, 128, 64, 32),
        activation='relu',
        solver='adam',
        learning_rate='adaptive',
        max_iter=10000,
        batch_size=8,
        random_state=42,
    )
    nn_model.fit(X_train_scaled, y_train)
    train_duration = time.time() - start_train_time
    joblib.dump(nn_model, model_filename)
    print(f"Model saved to {model_filename}")

# Predictions
start_test_time = time.time()
y_pred = nn_model.predict(X_test_scaled)
test_duration = time.time() - start_test_time


# Evaluate the model
mae = mean_absolute_error(y_test, y_pred)

output_log_file.write(f"Training Time: {train_duration:.6f} seconds\n")
output_log_file.write(f"Testing Time (Prediction): {test_duration:.6f} seconds\n")
output_log_file.write(f"Mean Absolute Error (MAE): {mae}\n")

comparison_df = pd.DataFrame({
    "Actual SDC Rate": y_test.map(lambda x: float(f"{x:.2f}")).values, 
    "Predicted SDC Rate": np.array([float(f"{x:.2f}") for x in y_pred])
})

comparison_df["Absolute Difference"] = abs(
    (comparison_df["Actual SDC Rate"] - comparison_df["Predicted SDC Rate"])
) 

print("\nInference:")
print(comparison_df.head())
comparison_df.to_csv("model_prediction.csv", index=False)

output_log_file.close()


# ===== Group mapping =====
sdc_grouping_info = [[0.0, 12.8], [12.8, 15.6], [15.6, 18.4], [18.4, 21.2], [21.2, 24.0], [24.0, 26.8], [26.8, 29.6], [29.6, 32.4], [32.4, 35.2], [35.2, 100.0]]

def get_input_group(sdc_rate):
    for i, bound in enumerate(sdc_grouping_info):
        if bound[0] <= sdc_rate < bound[1]:
            return i
    return -1

with open("representative_input_list.txt", 'r') as f:
        rep_inputs = [line.strip() for line in f.readlines() if line.strip()]

# Re-read the original input strings from the test file
df_test_raw = pd.read_csv(test_file_path, header=None, names=["input", "SDC Rate"])
original_inputs = df_test_raw["input"].str.replace('"', '')

# Round predicted SDC rates to 2 decimal places
rounded_preds = [float(f"{val:.2f}") for val in y_pred]

# Combine original inputs with predictions
result_array = list(zip(original_inputs, rounded_preds))

for input_str, predicted_sdc in result_array:
    pred_gid = get_input_group(predicted_sdc)
    pred_rep = rep_inputs[pred_gid]
    
    print(f"Protected binary based on input \'{pred_rep}\' is selected for input \'{input_str}\'")
    os.system(f"cp -r ../../b-Offline-PreProtected-Binary-Generation/c-Particlefilter/protected-binary-for-{pred_rep.replace(' ', '-')} protected-binary-for-{input_str.replace(' ', '-')}")


######