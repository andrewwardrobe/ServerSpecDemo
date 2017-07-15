node ('docker-host'){
    stage('checkout'){
        //sshagent(['ca208be7-50a7-4705-98f7-e24fcabc9537']) {
            git 'https://github.com/andrewwardrobe/ServerSpecDemo.git'
    }
    stage('Prepare Environments'){
            sh 'bundle install'
    }
    stage('Run Tests'){
            sh ' bundle exec rake serverspec'
        //}
    }
    stage('Publish Reports'){
        junit 'reports**/*.xml'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'reports/', reportFiles: '*.html', reportName: 'HTML Report', reportTitles: ''])
    }
}