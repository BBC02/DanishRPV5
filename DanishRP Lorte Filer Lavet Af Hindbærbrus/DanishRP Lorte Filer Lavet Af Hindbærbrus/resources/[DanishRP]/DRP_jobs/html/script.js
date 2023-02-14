var job = 'unemployed';
var grade = 3;

const NameResource = "drp_jobs"



$(document).keyup(function(e) {
    if (e.keyCode === 27) {

        $.post('https://drp_jobs/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

    }


});




// load a language

function playClickSound() {
    var audio = document.getElementById("audio");
    audio.volume = 0.1;
    audio.play();
}

function openBossMenu(job, label, employees, fund, canwithdraw, candeposit, canhire, canrank, canfire, ranks, canbonus) {
    console.log("åbner") // debug
    currentRanks = ranks;
    currentBossMenuJob = job;
    var fund2 = (fund).toLocaleString(
        undefined, // leave undefined to use the visitor's browser 
        // locale or a string like 'en-US' to override it.
    );
    //console.log(fund2)


    //HEADERS
    var base = '<div class="company-container">';
    base = base + '    <div class="company-wrapper">';
    base = base + '        <div class="company-header">';
    base = base + '            <div class="company-account">';
    base = base + '                <h1 id="f3">Konti: ' + fund2 + ',- DKK</h1>'; //debug
    base = base + '            </div>';
    base = base + '            <div class="company-account buttons">';
    base = base + '                <button onclick="DepositAccount()">Indsæt penge</button>'; //debug
    base = base + '                <button onclick="WithdrawAccount()">Hæv penge</button>'; //debug
    base = base + '            </div>';
    base = base + '        </div>';

    base2 =
        base = base + '<h1 id="f3"></h1>'

    //COMPANY STUFF

    base = base + '            <div class="company-content">';
    base = base + '                <div class="company-content-header">';
    base = base + '                    <h1>Liste over ansatte</h1>';
    base = base + '                    <button onclick="HireEmployee()">Ansæt en ny medarbejder</button>';
    base = base + '                </div>';
    base = base + '                <table style="overflow-y: visible;" id="EmployeeTable" class="company-employes">';
    base = base + '                    <thead>';
    base = base + '                        <tr>';
    base = base + '                            <th>Navn</th>';
    base = base + '                            <th>Stilling</th>';
    base = base + '                            <th id="handlingtext">Handling (' + employees.length + ')</th>'; //debug
    base = base + '                        </tr>';
    base = base + '                    </thead>';


    employees.forEach(function(data, i) {

        base = base + '                    <tbody v-if="!IsObjectEmpty(filteredEmployes)">'; //debug
        base = base + '                        <tr v-for="(employee) in filteredEmployes" :key="employee.id">'; //debug
        base = base + '                            <td>' + data.fullname + '</td>'; //debug
        base = base + '                            <td>' + data.grade_label + '</td>'; //debug
      //  console.log(JSON.stringify(data))
        base = base + `                            <td class="action"><button onclick='ChangeGrade(${JSON.stringify(data)})'>Ændre</button><button onclick='FireEmployee(${JSON.stringify(data)})'>Fyr</button></td>`; //debug
        base = base + '                        </tr>';
        base = base + '                    </tbody>';
    });
    base = base + '                </table>';
    base = base + `                <input type="text" id="searchemployee" oninput='SearchForEmployeee(${JSON.stringify(employees)})' placeholder="Søg efter bestemt ansat" />`;
    base = base + '            </div>';
    base = base + '        </div>';
    base = base + '    </div>';

    $("#main_container").html(base);
    //var base = '<div class="clearfix" id="page"><!-- group -->' +



    // base = base + '   <div class="gradient rounded-corners grpelem" id="u654"><!-- simple frame --></div>' +
    //     '    <div class="colelem" id="u657"><!-- simple frame --></div>' +
    //     '    <div class="clearfix colelem" id="u660-4"><!-- content -->' +
    //     '     <p>' + "KONTI" + '</p>' +
    //     '    </div>' +
    //     '    <div class="clearfix colelem" id="u667-4"><!-- content -->' +
    //     '     <p>FUNDS</p>' +
    //     '    </div>' +
    //     '    <div class="clearfix colelem" id="u663-4"><!-- content -->' +
    //     '     $' + "10000" +
    //     '    </div>' +
    //     '    <div class="clearfix colelem" id="pu670-4"><!-- group -->';
    // if (true) {
    //     base = base + '     <button class="rounded-corners  grpelem ripple" onclick="openWithdraw()" id="u670-4"><!-- content -->' +
    //         '      <p id="u670-2">WITHDRAW</p>' +
    //         '     </button>';
    // } else {
    //     base = base + '     <button class="rounded-corners  grpelem ripple" style="opacity: 0.5;" id="u670-4"><!-- content -->' +
    //         '      <p id="u670-2">WITHDRAW</p>' +
    //         '     </button>';
    // }
    // if (true) {
    //     base = base + '     <button class="rounded-corners  grpelem ripple" onclick="openDeposit()" id="u673-4"><!-- content -->' +
    //         '      <p id="u673-2">DEPOSIT</p>' +
    //         '     </button>';
    // } else {
    //     base = base + '     <button class="rounded-corners  grpelem ripple" style="opacity: 0.5;" id="u673-4"><!-- content -->' +
    //         '      <p id="u673-2">DEPOSIT</p>' +
    //         '     </button>';
    // }
    // base = base + '    </div>' +
    //     '    <div class="clearfix colelem" id="u688-4"><!-- content -->' +
    //     '     <p>EMPLOYEES (' + "nigger employee" + ')</p>' +
    //     '    </div>' +
    //     '    <div class="clearfix colelem" id="u682"><!-- column -->';


    // base = base + '     <div class="rounded-corners clearfix colelem" id="u745"><!-- group -->' +
    //     '      <div class="clearfix grpelem" id="pu746-4"><!-- column -->' +
    //     '       <div class="clearfix colelem" id="u746-4"><!-- content -->' +
    //     '        <p><span id="u746">' + '</span></p>' +
    //     '       </div>' +
    //     '       <div class="clearfix colelem" id="u747-4"><!-- content -->' +
    //     '        <p>' + '</p>' +
    //     '       </div>' +
    //     '      </div>';
    // if (true) {
    //     base = base + '      <div class="grpelem ripple" data-identifier="' + '" onclick="openRanks(this)" id="u749"><i class="fas fa-layer-group " ></i></div>';
    // }

    // if (true) {
    //     base = base + '      <div class="grpelem ripple" data-identifier="' + '" onclick="sureWindow(this)" id="u748"><i class="fas fa-times fa-lg " ></i></div>';
    // }

    // if (true) {
    //     base = base + '      <div class="grpelem ripple" data-identifier="' + '" onclick="openBonus(this)" id="u747"><i class="fas fa-hand-holding-usd " ></i></div>';
    // }




    // base = base + '     </div>';


    // base = base + '    </div>' +
    //     '   </div>' +
    //     '   <div class="verticalspacer" data-offset-top="0" data-content-above-spacer="712" data-content-below-spacer="18"></div>' +

    //     '  </div>';




    $("#main_container").html(base);



}





function BringMenuUp() {
    playClickSound();
    openBossMenu();
}

function openHire() {

    playClickSound();


    var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

        '        <p id="inputtext">HIRE</p>' +
        '<i class="fas fa-id-badge fa-lg" id="inputdollar"></i>' +
        '<input type="text" id="inputin" placeholder="0"></input>' +
        '     <button class="rounded-corners  grpelem ripple" onclick="hireperson(this)" id="u673-5"><!-- content -->' +
        '      <p id="u673-2">HIRE</p>' +
        '     </button>' +

        '</div>' +
        '</div>';

    $("#pu657").append(base);


}

function openBonus(t) {

    playClickSound();

    var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

        '        <p id="inputtext">ENTER BONUS</p>' +
        '<i class="fas fa-dollar-sign fa-lg" id="inputdollar"></i>' +
        '<input type="text" id="inputin" placeholder="0"></input>' +
        '     <button class="rounded-corners  grpelem ripple" data-identifier="' + t.dataset.identifier + '" onclick="givebonus(this)" id="u673-5"><!-- content -->' +
        '      <p id="u673-2">GIVE</p>' +
        '     </button>' +

        '</div>' +
        '</div>';

    $("#pu657").append(base);


}

function openWithdraw() {

    playClickSound();

    var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

        '        <p id="inputtext">WITHDRAW</p>' +
        '<i class="fas fa-dollar-sign fa-lg" id="inputdollar"></i>' +
        '<input type="text" id="inputin" placeholder="0"></input>' +
        '     <button class="rounded-corners  grpelem ripple" onclick="withdrawAmount(this)" id="u673-5"><!-- content -->' +
        '      <p id="u673-2">WITHDRAW</p>' +
        '     </button>' +

        '</div>' +
        '</div>';

    $("#pu657").append(base);


}

function openDeposit() {

    playClickSound();


    var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

        '        <p id="inputtext">DEPOSIT</p>' +
        '<i class="fas fa-dollar-sign fa-lg" id="inputdollar"></i>' +
        '<input type="text" id="inputin" placeholder="0"></input>' +
        '     <button class="rounded-corners  grpelem ripple" onclick="depositAmount(this)" id="u673-5"><!-- content -->' +
        '      <p id="u673-2">DEPOSIT</p>' +
        '     </button>' +

        '</div>' +
        '</div>';

    $("#pu657").append(base);


}

async function FireEmployee(employee) {

    Swal.fire({
        title: 'Er du sikker på at du vil fyre ' + employee.fullname,
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: `Ja`,
        cancelButtonText: `Nej`,
    }).then((result) => {
        if (result.isConfirmed) {
            axios.post(`https://${NameResource}/fireEmployee`, {
                identifier: employee.identifier,
            }).catch(function(error) {
                console.log(error + ' : Error at fireEmployee');
            });
        }
    })
}



function sureWindow(t) {

    playClickSound();


    var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

        '        <p id="inputtext">ARE YOU SURE?</p>' +
        '        <p id="inputothertext">You want to fire ' + $(t).parent().find("#u746").text() + '</p>' +

        '     <button class="rounded-corners" data-identifier=""  grpelem ripple" onclick="fire(this)" id="u673-5"><!-- content -->' +
        '      <p id="u673-2">YES</p>' +
        '     </button>' +

        '</div>' +
        '</div>';

    $("#pu657").append(base);


}

function openRanks(t) {

    playClickSound();


    var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

        '        <p id="inputtext">RANKS</p>' +
        '      <div id="ranklist">';

    for (i = 0; i < currentRanks.length; i++) {

        base = base + '<div id="rankentry" data-identifier="' + t.dataset.identifier + '" data-grade="' + currentRanks[i].grade + '" onclick="promote(this)" class="ripple">' + currentRanks[i].grade_label.toUpperCase() + '</div>';
    }

    base = base + '</div>' +


        '</div>' +
        '</div>';

    $("#pu657").append(base);


}








async function DepositAccount() {

    (async() => {
        const {
            value: text
        } = await Swal.fire({
            title: 'Antal penge du vil sætte ind',
            input: 'text',
            inputPlaceholder: 'Antal penge du vil sætte ind',
            showCancelButton: true
        })

        if (text) {
            axios.post(`https://${NameResource}/depositAccount`, {
                amount: text,
            }).catch(function(error) {
                console.log(error + ' : Error at depositAccount');
            });
        }
    })()
};

async function WithdrawAccount() {

    (async() => {
        const {
            value: text
        } = await Swal.fire({
            title: 'Antal penge du vil hæve',
            input: 'text',
            inputPlaceholder: 'Antal penge du vil hæve',
            showCancelButton: true
        })

        if (text) {
            axios.post(`https://${NameResource}/withdrawAccount`, {
                amount: text,
            }).catch(function(error) {
                console.log(error + ' : Error at withdrawAccount');
            });
        }
    })()
};

async function HireEmployee(t) {

    playClickSound();

    const {
        value: text
    } = await Swal.fire({
        title: 'Indtast ID på personen du vil hyre',
        input: 'text',
        inputPlaceholder: 'ID på personen',
        showCancelButton: true
    })



    if (text) {
        
        let options = {};

        for (let key in grades) {
            let companygrade = grades[key];
            options[companygrade.grade] = companygrade.grade_label;
            
       //     console.log(key + " | " + companygrade + " | " + grades[key] + " | " + options[companygrade.grade])
       }

        (async() => {
            const {
                value: grade
            } = await Swal.fire({
                title: 'Vælg en ny stilling',
                input: 'select',
                inputOptions: options,
                inputPlaceholder: 'Vælg en stilling',
                showCancelButton: true,
            })

            if (grade) {
                axios.post(`https://${NameResource}/hireEmployee`, {
                    target: text,
                    grade: grade,
                }).catch(function(error) {
                    console.log(error + ' : Error at hireEmployee');
                });
            }
        })()
    }


    // var id = $(t).parent().find('#inputin').val();

    // $.post('https://drp_jobs/close', JSON.stringify({}));
    // $("#main_container").fadeOut("slow", function() {

    //     $("#main_container").html("").fadeIn();
    // });

    // $.post('https://drp_jobs/hire', JSON.stringify({ job: currentBossMenuJob, id: id }));
}

function withdrawAmount(t) {

    playClickSound();

    var amount = $(t).parent().find('#inputin').val();

    $.post('https://drp_jobs/close', JSON.stringify({}));
    $("#main_container").fadeOut("slow", function() {

        $("#main_container").html("").fadeIn();
    });

    $.post('https://drp_jobs/withdraw', JSON.stringify({ job: currentBossMenuJob, amount: amount }));
}


function givebonus(t) {

    playClickSound();

    var amount = $(t).parent().find('#inputin').val();
    var identifier = t.dataset.identifier;

    $.post('https://drp_jobs/close', JSON.stringify({}));
    $("#main_container").fadeOut("slow", function() {

        $("#main_container").html("").fadeIn();
    });

    $.post('https://drp_jobs/givebonus', JSON.stringify({ identifier: identifier, amount: amount, job: currentBossMenuJob }));
}


function depositAmount(t) {

    playClickSound();

    var amount = $(t).parent().find('#inputin').val();

    $.post('https://drp_jobs/close', JSON.stringify({}));
    $("#main_container").fadeOut("slow", function() {

        $("#main_container").html("").fadeIn();
    });

    $.post('https://drp_jobs/deposit', JSON.stringify({ job: currentBossMenuJob, amount: amount }));
}

function fire(t) {

    playClickSound();

    var identifier = t.dataset.identifier;


    $.post('https://drp_jobs/close', JSON.stringify({}));
    $("#main_container").fadeOut("slow", function() {

        $("#main_container").html("").fadeIn();
    });

    $.post('https://drp_jobs/fire', JSON.stringify({ identifier: identifier, job: currentBossMenuJob }));


}

function promote(t) {

    playClickSound();

    var rank = t.dataset.grade;
    var identifier = t.dataset.identifier;

    $.post('https://drp_jobs/close', JSON.stringify({}));
    $("#main_container").fadeOut("slow", function() {

        $("#main_container").html("").fadeIn();
    });

    $.post('https://drp_jobs/setrank', JSON.stringify({ identifier: identifier, rank: rank, job: currentBossMenuJob }));


}

function openJobCenter(defaultJobs) {


    var base = '<div id="jobcenter">';



    for (i = 0; i < defaultJobs.length; i++) {

        var text = 'SELECT';


        if (defaultJobs[i].job == job) {
            text = 'SELECTED';
        }


        base = base + '<div class="shadow gradient rounded-corners colelem animated fadeInUp" id="u712">' +
            '    <div class="clearfix grpelem" id="u465-4"><!-- content -->' +
            '      <p>' + defaultJobs[i].label + '</p>' +
            '     </div>' +
            '     <button class="rounded-corners grpelem ripple addjob" data-job="' + defaultJobs[i].job + '" id="u468-4"><!-- content -->' +
            text +
            '     </button>' +
            '     <div class="grpelem" id="u474"><i class="' + defaultJobs[i].icon + ' fa-3x"></i><!-- simple frame --></div>' +
            '     <div class="clearfix grpelem" id="u477-4"><!-- content -->' +
            '      <p>' + defaultJobs[i].description + '</p>' +
            '     </div>' +
            '     </div>';

    }




    base = base + '   </div>';


    $("#main_container").html(base);
}



window.addEventListener('message', function(event) {

    var edata = event.data;


    if (edata.type == "openBoss") {

        job = edata.job.job;
        grade = edata.job.grade;
        grades = edata.grades
      //  console.log(edata.grades.length)

        
        openBossMenu(edata.bossJob, edata.bossLabel, edata.employees, edata.fund, edata.perms.canWithdraw, edata.perms.canDeposit, edata.perms.canHire, edata.perms.canRank, edata.perms.canFire, edata.grades, edata.perms.canBonus);
        const totalgrades = edata.grades

    }

    if (edata.type == "openCenter") {

        job = edata.job.job;
        grade = edata.job.grade;
        offduty = edata.offduty;

        const centerJobs = JSON.parse(edata.center);



        openJobCenter(centerJobs);




    }


    $(".addjob").click(function() {
        playClickSound();

        if ($(this).text().replace(/ /g, '') != 'SELECTED') {
            $(document).find(".addjob").text('SELECT');
            $(this).text('SELECTED');
            $.post('https://drp_jobs/addjob', JSON.stringify({
                job: this.dataset.job

            }));
        }

    });




});

async function ChangeGrade(employee) {
   
    playClickSound();

    

    
    for (let key in grades) {
         let companygrade = grades[key];
         options[companygrade.grade] = companygrade.grade_label;
    //     console.log(key + " | " + companygrade + " | " + grades[key] + " | " + options[companygrade.grade])
    }

    (async() => {
        const {
            value: grade
        } = await Swal.fire({
            title: 'Vælg en ny stilling',
            input: 'select',
            inputOptions: options,
            inputPlaceholder: 'Vælg en stilling',
            showCancelButton: true,
        })

        if (grade) {
            axios.post(`https://${NameResource}/changeRank`, {
                identifier: employee.identifier,
                newRang: grade,
            }).catch(function(error) {
                console.log(error + ' : Error at changeRank');
            });
        }
    })()



    // var id = $(t).parent().find('#inputin').val();

    // $.post('https://drp_jobs/close', JSON.stringify({}));
    // $("#main_container").fadeOut("slow", function() {

    //     $("#main_container").html("").fadeIn();
    // });

    // $.post('https://drp_jobs/hire', JSON.stringify({ job: currentBossMenuJob, id: id }));
}