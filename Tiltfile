# =============================================================================
disable_snapshots()
analytics_settings(enable=False)
allow_k8s_contexts(os.getenv("TILT_ALLOW_CONTEXT"))

if os.environ.get('TILT_REGISTRY_PUSH'):
    default_registry(os.environ.get('TILT_REGISTRY_PUSH'), os.environ.get('TILT_REGISTRY_PULL'))
# =============================================================================

docker_build(
  ref="migrate-tilt-ref",
  context=".",
  dockerfile = './hack/container-images/migrate/Dockerfile',
  # target = '',
)

k8s_yaml(['hack/k8s/postgres.yaml',])
k8s_resource( workload = 'postgres')

k8s_yaml(['hack/k8s/tests.yaml',])
k8s_resource( workload = 'check-postgress-reachable-and-readable')

k8s_yaml(['hack/k8s/setup.yaml',])
k8s_resource(
  workload = 'setup-env',
  trigger_mode = TRIGGER_MODE_MANUAL,
)