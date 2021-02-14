#!/usr/bin/env groovy

library 'defn/jenkins-kiki@main'

def config = [
  role: 'letfn--vault',
  roleId: '16848174-ed2e-0682-676b-5274c03610d4',
  pipelineSecrets: [[
    path: 'kv/pipeline/letfn--vault',
    secretValues: [
    ]
  ]]
]

goreleaserMain(config) {
  if (env.TAG_NAME) {
    stage('Test Docker image') {
      sh("/env.sh figlet -f /j/chunky.flf test docker")
      sh "/env.sh docker run --rm --entrypoint /main defn/vault:1.6.2-${env.GORELEASER_CURRENT_TAG.minus('v')}-amd64"
    }
  }
  else {
    stage('Test') {
      sh("/env.sh figlet -f /j/chunky.flf test")
      sh "uname -a"
    }
  }
}
