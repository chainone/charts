{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "gogs.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gogs.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gogs.gogs.fullname" -}}
{{- printf "%s-%s" .Release.Name "gogs" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified mysql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gogs.mysql.fullname" -}}
{{- $name := default "mysql" .Values.mysql.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Determine database user based on use of mysql dependency.
*/}}
{{- define "gogs.database.host" -}}
{{- if .Values.mysql.install -}}
{{- template "gogs.mysql.fullname" . -}}
{{- else -}}
{{- .Values.service.gogs.databaseHost | quote -}}
{{- end -}}
{{- end -}}

{{/*
Determine database user based on use of mysql dependency.
*/}}
{{- define "gogs.database.user" -}}
{{- if .Values.mysql.install -}}
{{- .Values.mysql.mysqlUser | quote -}}
{{- else -}}
{{- .Values.service.gogs.databaseUser | quote -}}
{{- end -}}
{{- end -}}

{{/*
Determine database password based on use of mysql dependency.
*/}}
{{- define "gogs.database.password" -}}
{{- if .Values.mysql.install -}}
{{- .Values.mysql.mysqlPassword | quote -}}
{{- else -}}
{{- .Values.service.gogs.databasePassword | quote -}}
{{- end -}}
{{- end -}}

{{/*
Determine database name based on use of mysql dependency.
*/}}
{{- define "gogs.database.name" -}}
{{- if .Values.mysql.install -}}
{{- .Values.mysql.mysqlDatabase | quote -}}
{{- else -}}
{{- .Values.service.gogs.databaseName | quote -}}
{{- end -}}
{{- end -}}
