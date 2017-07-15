node ('docker-host'){
    stage('checkout'){
        //sshagent(['ca208be7-50a7-4705-98f7-e24fcabc9537']) {
            git 'https://github.com/andrewwardrobe/ServerSpecDemo.git'
            sh 'bundle install'
            sh ' bundle exec rake serverspec'
        //}
        junit 'reports**/*.xml'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'reports/', reportFiles: '*.html', reportName: 'HTML Report', reportTitles: ''])

    }
}