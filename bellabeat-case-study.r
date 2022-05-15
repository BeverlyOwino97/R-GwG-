{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "5307eaea",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:27.375948Z",
     "iopub.status.busy": "2022-05-15T13:40:27.373562Z",
     "iopub.status.idle": "2022-05-15T13:40:28.635316Z",
     "shell.execute_reply": "2022-05-15T13:40:28.633452Z"
    },
    "papermill": {
     "duration": 1.272053,
     "end_time": "2022-05-15T13:40:28.637698",
     "exception": false,
     "start_time": "2022-05-15T13:40:27.365645",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.6     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'fitbit'"
      ],
      "text/latex": [
       "'fitbit'"
      ],
      "text/markdown": [
       "'fitbit'"
      ],
      "text/plain": [
       "[1] \"fitbit\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "raw",
   "id": "a16875f6",
   "metadata": {
    "papermill": {
     "duration": 0.004827,
     "end_time": "2022-05-15T13:40:28.647686",
     "exception": false,
     "start_time": "2022-05-15T13:40:28.642859",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "install.packages('dplyr')\n",
    "install.packages('plotly')\n",
    "install.packages('skimr')\n",
    "install.packages('cowplot')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "df21628f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:28.689421Z",
     "iopub.status.busy": "2022-05-15T13:40:28.658673Z",
     "iopub.status.idle": "2022-05-15T13:40:29.048895Z",
     "shell.execute_reply": "2022-05-15T13:40:29.047147Z"
    },
    "papermill": {
     "duration": 0.39932,
     "end_time": "2022-05-15T13:40:29.051692",
     "exception": false,
     "start_time": "2022-05-15T13:40:28.652372",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘plotly’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:ggplot2’:\n",
      "\n",
      "    last_plot\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:graphics’:\n",
      "\n",
      "    layout\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    config\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:cowplot’:\n",
      "\n",
      "    stamp\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(dplyr)\n",
    "library(ggplot2)\n",
    "library(skimr)\n",
    "library(cowplot)\n",
    "library(plotly)\n",
    "library(lubridate)\n",
    "library(readr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "e388c127",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.065887Z",
     "iopub.status.busy": "2022-05-15T13:40:29.064340Z",
     "iopub.status.idle": "2022-05-15T13:40:29.371291Z",
     "shell.execute_reply": "2022-05-15T13:40:29.368735Z"
    },
    "papermill": {
     "duration": 0.317546,
     "end_time": "2022-05-15T13:40:29.374905",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.057359",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m940\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (1): ActivityDate\n",
      "\u001b[32mdbl\u001b[39m (14): Id, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDi...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "daily_activity <- read_csv('../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "e490431b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.388988Z",
     "iopub.status.busy": "2022-05-15T13:40:29.387519Z",
     "iopub.status.idle": "2022-05-15T13:40:29.418246Z",
     "shell.execute_reply": "2022-05-15T13:40:29.415956Z"
    },
    "papermill": {
     "duration": 0.040692,
     "end_time": "2022-05-15T13:40:29.421178",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.380486",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 940\n",
      "Columns: 15\n",
      "$ Id                       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 150396036…\n",
      "$ ActivityDate             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4/12/2016\", \"4/13/2016\", \"4/14/2016\", \"4/15/…\n",
      "$ TotalSteps               \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 13162, 10735, 10460, 9762, 12669, 9705, 13019…\n",
      "$ TotalDistance            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8.50, 6.97, 6.74, 6.28, 8.16, 6.48, 8.59, 9.8…\n",
      "$ TrackerDistance          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8.50, 6.97, 6.74, 6.28, 8.16, 6.48, 8.59, 9.8…\n",
      "$ LoggedActivitiesDistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ VeryActiveDistance       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1.88, 1.57, 2.44, 2.14, 2.71, 3.19, 3.25, 3.5…\n",
      "$ ModeratelyActiveDistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0.55, 0.69, 0.40, 1.26, 0.41, 0.78, 0.64, 1.3…\n",
      "$ LightActiveDistance      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 6.06, 4.71, 3.91, 2.83, 5.04, 2.51, 4.71, 5.0…\n",
      "$ SedentaryActiveDistance  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ VeryActiveMinutes        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 25, 21, 30, 29, 36, 38, 42, 50, 28, 19, 66, 4…\n",
      "$ FairlyActiveMinutes      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 13, 19, 11, 34, 10, 20, 16, 31, 12, 8, 27, 21…\n",
      "$ LightlyActiveMinutes     \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 328, 217, 181, 209, 221, 164, 233, 264, 205, …\n",
      "$ SedentaryMinutes         \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 728, 776, 1218, 726, 773, 539, 1149, 775, 818…\n",
      "$ Calories                 \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1985, 1797, 1776, 1745, 1863, 1728, 1921, 203…\n"
     ]
    }
   ],
   "source": [
    "glimpse(daily_activity)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "0af28acb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.436130Z",
     "iopub.status.busy": "2022-05-15T13:40:29.434580Z",
     "iopub.status.idle": "2022-05-15T13:40:29.536229Z",
     "shell.execute_reply": "2022-05-15T13:40:29.534393Z"
    },
    "papermill": {
     "duration": 0.112324,
     "end_time": "2022-05-15T13:40:29.539098",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.426774",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m413\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m5\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (1): SleepDay\n",
      "\u001b[32mdbl\u001b[39m (4): Id, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "sleep_day <- read_csv('../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "d8f79718",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.554819Z",
     "iopub.status.busy": "2022-05-15T13:40:29.553348Z",
     "iopub.status.idle": "2022-05-15T13:40:29.644591Z",
     "shell.execute_reply": "2022-05-15T13:40:29.642820Z"
    },
    "papermill": {
     "duration": 0.102027,
     "end_time": "2022-05-15T13:40:29.646792",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.544765",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m67\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m8\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (1): Date\n",
      "\u001b[32mdbl\u001b[39m (6): Id, WeightKg, WeightPounds, Fat, BMI, LogId\n",
      "\u001b[33mlgl\u001b[39m (1): IsManualReport\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "weight <- read_csv('../input/fitbit/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "741fc449",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.661771Z",
     "iopub.status.busy": "2022-05-15T13:40:29.660228Z",
     "iopub.status.idle": "2022-05-15T13:40:29.798588Z",
     "shell.execute_reply": "2022-05-15T13:40:29.796898Z"
    },
    "papermill": {
     "duration": 0.148354,
     "end_time": "2022-05-15T13:40:29.801019",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.652665",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m22099\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m3\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (1): ActivityHour\n",
      "\u001b[32mdbl\u001b[39m (2): Id, StepTotal\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "hourly_step <- read_csv('../input/fitbit/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "3ba129b4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.816755Z",
     "iopub.status.busy": "2022-05-15T13:40:29.815241Z",
     "iopub.status.idle": "2022-05-15T13:40:29.844637Z",
     "shell.execute_reply": "2022-05-15T13:40:29.843008Z"
    },
    "papermill": {
     "duration": 0.039443,
     "end_time": "2022-05-15T13:40:29.846858",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.807415",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/14/2016</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/16/2016</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t 1503960366 & 4/13/2016 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t 1503960366 & 4/14/2016 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t 1503960366 & 4/15/2016 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t 1503960366 & 4/16/2016 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t 1503960366 & 4/17/2016 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityDate &lt;chr&gt; | TotalSteps &lt;dbl&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;dbl&gt; | FairlyActiveMinutes &lt;dbl&gt; | LightlyActiveMinutes &lt;dbl&gt; | SedentaryMinutes &lt;dbl&gt; | Calories &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 4/12/2016 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 1503960366 | 4/13/2016 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 1503960366 | 4/14/2016 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 1503960366 | 4/15/2016 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 1503960366 | 4/16/2016 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 1503960366 | 4/17/2016 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 4/12/2016    13162      8.50          8.50           \n",
       "2 1503960366 4/13/2016    10735      6.97          6.97           \n",
       "3 1503960366 4/14/2016    10460      6.74          6.74           \n",
       "4 1503960366 4/15/2016     9762      6.28          6.28           \n",
       "5 1503960366 4/16/2016    12669      8.16          8.16           \n",
       "6 1503960366 4/17/2016     9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(daily_activity)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "979a0137",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.862689Z",
     "iopub.status.busy": "2022-05-15T13:40:29.861052Z",
     "iopub.status.idle": "2022-05-15T13:40:29.885165Z",
     "shell.execute_reply": "2022-05-15T13:40:29.883080Z"
    },
    "papermill": {
     "duration": 0.034552,
     "end_time": "2022-05-15T13:40:29.887904",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.853352",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>SleepDay</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/16/2016 12:00:00 AM</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/17/2016 12:00:00 AM</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/19/2016 12:00:00 AM</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Id & SleepDay & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 12:00:00 AM & 1 & 327 & 346\\\\\n",
       "\t 1503960366 & 4/13/2016 12:00:00 AM & 2 & 384 & 407\\\\\n",
       "\t 1503960366 & 4/15/2016 12:00:00 AM & 1 & 412 & 442\\\\\n",
       "\t 1503960366 & 4/16/2016 12:00:00 AM & 2 & 340 & 367\\\\\n",
       "\t 1503960366 & 4/17/2016 12:00:00 AM & 1 & 700 & 712\\\\\n",
       "\t 1503960366 & 4/19/2016 12:00:00 AM & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| Id &lt;dbl&gt; | SleepDay &lt;chr&gt; | TotalSleepRecords &lt;dbl&gt; | TotalMinutesAsleep &lt;dbl&gt; | TotalTimeInBed &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1503960366 | 4/12/2016 12:00:00 AM | 1 | 327 | 346 |\n",
       "| 1503960366 | 4/13/2016 12:00:00 AM | 2 | 384 | 407 |\n",
       "| 1503960366 | 4/15/2016 12:00:00 AM | 1 | 412 | 442 |\n",
       "| 1503960366 | 4/16/2016 12:00:00 AM | 2 | 340 | 367 |\n",
       "| 1503960366 | 4/17/2016 12:00:00 AM | 1 | 700 | 712 |\n",
       "| 1503960366 | 4/19/2016 12:00:00 AM | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         SleepDay              TotalSleepRecords TotalMinutesAsleep\n",
       "1 1503960366 4/12/2016 12:00:00 AM 1                 327               \n",
       "2 1503960366 4/13/2016 12:00:00 AM 2                 384               \n",
       "3 1503960366 4/15/2016 12:00:00 AM 1                 412               \n",
       "4 1503960366 4/16/2016 12:00:00 AM 2                 340               \n",
       "5 1503960366 4/17/2016 12:00:00 AM 1                 700               \n",
       "6 1503960366 4/19/2016 12:00:00 AM 1                 304               \n",
       "  TotalTimeInBed\n",
       "1 346           \n",
       "2 407           \n",
       "3 442           \n",
       "4 367           \n",
       "5 712           \n",
       "6 320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(sleep_day)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "c09ce03a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.904726Z",
     "iopub.status.busy": "2022-05-15T13:40:29.903095Z",
     "iopub.status.idle": "2022-05-15T13:40:29.929467Z",
     "shell.execute_reply": "2022-05-15T13:40:29.927403Z"
    },
    "papermill": {
     "duration": 0.037386,
     "end_time": "2022-05-15T13:40:29.932169",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.894783",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>Date</th><th scope=col>WeightKg</th><th scope=col>WeightPounds</th><th scope=col>Fat</th><th scope=col>BMI</th><th scope=col>IsManualReport</th><th scope=col>LogId</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>5/2/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td> TRUE</td><td>1.462234e+12</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/3/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td> TRUE</td><td>1.462320e+12</td></tr>\n",
       "\t<tr><td>1927972279</td><td>4/13/2016 1:08:52 AM </td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>FALSE</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><td>2873212765</td><td>4/21/2016 11:59:59 PM</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td> TRUE</td><td>1.461283e+12</td></tr>\n",
       "\t<tr><td>2873212765</td><td>5/12/2016 11:59:59 PM</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td> TRUE</td><td>1.463098e+12</td></tr>\n",
       "\t<tr><td>4319703577</td><td>4/17/2016 11:59:59 PM</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td> TRUE</td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 8\n",
       "\\begin{tabular}{llllllll}\n",
       " Id & Date & WeightKg & WeightPounds & Fat & BMI & IsManualReport & LogId\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <lgl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 5/2/2016 11:59:59 PM  &  52.6 & 115.9631 & 22 & 22.65 &  TRUE & 1.462234e+12\\\\\n",
       "\t 1503960366 & 5/3/2016 11:59:59 PM  &  52.6 & 115.9631 & NA & 22.65 &  TRUE & 1.462320e+12\\\\\n",
       "\t 1927972279 & 4/13/2016 1:08:52 AM  & 133.5 & 294.3171 & NA & 47.54 & FALSE & 1.460510e+12\\\\\n",
       "\t 2873212765 & 4/21/2016 11:59:59 PM &  56.7 & 125.0021 & NA & 21.45 &  TRUE & 1.461283e+12\\\\\n",
       "\t 2873212765 & 5/12/2016 11:59:59 PM &  57.3 & 126.3249 & NA & 21.69 &  TRUE & 1.463098e+12\\\\\n",
       "\t 4319703577 & 4/17/2016 11:59:59 PM &  72.4 & 159.6147 & 25 & 27.45 &  TRUE & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 8\n",
       "\n",
       "| Id &lt;dbl&gt; | Date &lt;chr&gt; | WeightKg &lt;dbl&gt; | WeightPounds &lt;dbl&gt; | Fat &lt;dbl&gt; | BMI &lt;dbl&gt; | IsManualReport &lt;lgl&gt; | LogId &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 5/2/2016 11:59:59 PM  |  52.6 | 115.9631 | 22 | 22.65 |  TRUE | 1.462234e+12 |\n",
       "| 1503960366 | 5/3/2016 11:59:59 PM  |  52.6 | 115.9631 | NA | 22.65 |  TRUE | 1.462320e+12 |\n",
       "| 1927972279 | 4/13/2016 1:08:52 AM  | 133.5 | 294.3171 | NA | 47.54 | FALSE | 1.460510e+12 |\n",
       "| 2873212765 | 4/21/2016 11:59:59 PM |  56.7 | 125.0021 | NA | 21.45 |  TRUE | 1.461283e+12 |\n",
       "| 2873212765 | 5/12/2016 11:59:59 PM |  57.3 | 126.3249 | NA | 21.69 |  TRUE | 1.463098e+12 |\n",
       "| 4319703577 | 4/17/2016 11:59:59 PM |  72.4 | 159.6147 | 25 | 27.45 |  TRUE | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Date                  WeightKg WeightPounds Fat BMI  \n",
       "1 1503960366 5/2/2016 11:59:59 PM   52.6    115.9631     22  22.65\n",
       "2 1503960366 5/3/2016 11:59:59 PM   52.6    115.9631     NA  22.65\n",
       "3 1927972279 4/13/2016 1:08:52 AM  133.5    294.3171     NA  47.54\n",
       "4 2873212765 4/21/2016 11:59:59 PM  56.7    125.0021     NA  21.45\n",
       "5 2873212765 5/12/2016 11:59:59 PM  57.3    126.3249     NA  21.69\n",
       "6 4319703577 4/17/2016 11:59:59 PM  72.4    159.6147     25  27.45\n",
       "  IsManualReport LogId       \n",
       "1  TRUE          1.462234e+12\n",
       "2  TRUE          1.462320e+12\n",
       "3 FALSE          1.460510e+12\n",
       "4  TRUE          1.461283e+12\n",
       "5  TRUE          1.463098e+12\n",
       "6  TRUE          1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(weight)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "561deba5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:29.948517Z",
     "iopub.status.busy": "2022-05-15T13:40:29.946990Z",
     "iopub.status.idle": "2022-05-15T13:40:29.991796Z",
     "shell.execute_reply": "2022-05-15T13:40:29.989885Z"
    },
    "papermill": {
     "duration": 0.055577,
     "end_time": "2022-05-15T13:40:29.994542",
     "exception": false,
     "start_time": "2022-05-15T13:40:29.938965",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "3"
      ],
      "text/latex": [
       "3"
      ],
      "text/markdown": [
       "3"
      ],
      "text/plain": [
       "[1] 3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#checking for duplicates\n",
    "sum(duplicated(daily_activity))\n",
    "sum(duplicated(weight))\n",
    "sum(duplicated(sleep_day))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "9e258d46",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:30.012412Z",
     "iopub.status.busy": "2022-05-15T13:40:30.010879Z",
     "iopub.status.idle": "2022-05-15T13:40:30.030665Z",
     "shell.execute_reply": "2022-05-15T13:40:30.028986Z"
    },
    "papermill": {
     "duration": 0.031071,
     "end_time": "2022-05-15T13:40:30.032963",
     "exception": false,
     "start_time": "2022-05-15T13:40:30.001892",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Removing duplicates\n",
    "sleep_day <- sleep_day %>% distinct()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "88247026",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:30.050648Z",
     "iopub.status.busy": "2022-05-15T13:40:30.049098Z",
     "iopub.status.idle": "2022-05-15T13:40:30.074537Z",
     "shell.execute_reply": "2022-05-15T13:40:30.072935Z"
    },
    "papermill": {
     "duration": 0.036543,
     "end_time": "2022-05-15T13:40:30.076630",
     "exception": false,
     "start_time": "2022-05-15T13:40:30.040087",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "65"
      ],
      "text/latex": [
       "65"
      ],
      "text/markdown": [
       "65"
      ],
      "text/plain": [
       "[1] 65"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Checking for Not Available\n",
    "sum(is.na(daily_activity))\n",
    "sum(is.na(sleep_day))\n",
    "sum(is.na(weight))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "849babe8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T13:40:30.095171Z",
     "iopub.status.busy": "2022-05-15T13:40:30.093742Z",
     "iopub.status.idle": "2022-05-15T13:40:30.118544Z",
     "shell.execute_reply": "2022-05-15T13:40:30.116835Z"
    },
    "papermill": {
     "duration": 0.03645,
     "end_time": "2022-05-15T13:40:30.120860",
     "exception": false,
     "start_time": "2022-05-15T13:40:30.084410",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Add a new column for the weekdays\n",
    "daily_activity <- daily_activity %>% mutate( Weekday = weekdays(as.Date(ActivityDate, \"%m%d%Y\")))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "db7c870e",
   "metadata": {
    "papermill": {
     "duration": 0.007637,
     "end_time": "2022-05-15T13:40:30.136415",
     "exception": false,
     "start_time": "2022-05-15T13:40:30.128778",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.171156,
   "end_time": "2022-05-15T13:40:30.265637",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-05-15T13:40:24.094481",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
