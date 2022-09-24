json.extract! session, :id, :weight, :reps, :exercise_id, :created_at, :updated_at
json.url session_url(session, format: :json)
