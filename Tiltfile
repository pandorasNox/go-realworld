
disable_snapshots()
analytics_settings(enable=False)
allow_k8s_contexts(os.getenv("TILT_ALLOW_CONTEXT"))


k8s_yaml(['hack/k8s/postgres.yaml',])
k8s_resource ( workload = 'postgres')

k8s_yaml(['hack/k8s/tests.yaml',])
k8s_resource ( workload = 'check-postgress-reachable-and-readable')
