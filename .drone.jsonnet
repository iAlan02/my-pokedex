local write(env) = {
  name: 'write %(env)s' % { env: env }
  image: ubuntu
  commands: 
    ['echo Hello world from %(env)s!' % { env: env }]
}

local test_pipeline = {
  kind: pipeline
  type: docker
  name: Test
  steps: [
    write(env='DEV')
  ]
  trigger: {
    ref: [
      branch
    ],
    event: [
      'master'
    ]
  }
}

local test_pipeline = {
  kind: pipeline
  type: docker
  name: Prod
  steps: [
    write(env='PROD')
  ]
  trigger: {
    ref: [
      branch
    ],
    event: [
      'promote'
    ],
    target: [
      'PROD'
    ]
  }
}

[
test_pipeline,
]