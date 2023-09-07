node {

  withFolderProperties {
    
      def repoName = 'pipeline-test'
      def branch = 'main'
      // setting.multibranchPipelineSetting(repoName, branch)
      def deployName = 'data-pipeline'
      def deployHost = 'server'
      def sshCredential = 'server-key' //setting.getSSHCredentialId(deployName)
      def projectDirectory = '/home/dpadmin/deploy/main/pipeline-test' 
      // def repoURL = env.REPO_URL
      
      // stage('Checkout') {
      //   dir('src') {
      //     build.checkout(branch, repoURL)
      //   }
      // }
      stage('Git clone branch') {
        withCredentials([
            sshUserPrivateKey(
              credentialsId: sshCredential,
              keyFileVariable: 'keyfile',
              usernameVariable: 'username'
            )
          ]) {
            def remote = [:]
            remote.name = "remote-${deployHost}-${repoName}"
            remote.pty = true
            remote.host = deployHost
            remote.allowAnyHosts = true
            remote.user = username // "dpadmin"
            remote.identityFile = keyfile
            echo "project dir ${projectDirectory}"
            sshCommand remote: remote, command: "[ ! -d '${projectDirectory}' ] && mkdir -p ${projectDirectory} && cd ${projectDirectory} && git clone https://github.com/zsu58/pipeline_test . || true"
          }
      }
      // stage('Git Pull Remote') {
      //   withCredentials([
      //       sshUserPrivateKey(
      //         credentialsId: sshCredential,
      //         keyFileVariable: 'keyfile',
      //         usernameVariable: 'username'
      //       )
      //     ]) {
      //       def remote = [:]
      //       remote.name = "remote-${deployHost}-${repoName}"
      //       remote.pty = true
      //       remote.host = deployHost
      //       remote.allowAnyHosts = true
      //       remote.user = username
      //       remote.identityFile = keyfile
      //       echo "${branch}"

      //       sshCommand remote: remote, command: "cd ${projectDirectory}; git checkout ${branch}"
      //       sshCommand remote: remote, command: "cd ${projectDirectory}; git fetch origin"
      //       sshCommand remote: remote, command: "cd ${projectDirectory}; git reset --hard origin/${branch}"
      //       sshCommand remote: remote, command: "cd ${projectDirectory}; git pull"
            
      //     }

      // }
      // stage('Generate workflows') {
      //     withCredentials([
      //         sshUserPrivateKey(
      //           credentialsId: sshCredential,
      //           keyFileVariable: 'keyfile',
      //           usernameVariable: 'username'
      //         )
      //       ]) {
      //         def remote = [:]
      //         remote.name = "remote-${deployHost}-${repoName}"
      //         remote.pty = true
      //         remote.host = deployHost
      //         remote.allowAnyHosts = true
      //         remote.user = username
      //         remote.identityFile = keyfile
      //         sshCommand remote: remote, command: "cd ${projectDirectory}; make all || true"
      //         // sshCommand remote: remote, command: "docker exec -it hrs-pipeline-dkuh-airflow-webserver-1 make all || true", sudo: false
      //       }
      // }
    
  }
}
