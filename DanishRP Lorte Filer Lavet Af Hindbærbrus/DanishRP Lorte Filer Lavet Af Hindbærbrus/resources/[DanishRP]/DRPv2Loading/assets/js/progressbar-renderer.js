Init();

//Cache to keep track of all progress values.
//This is need for the Math.max functions (so no backwards progressbars).
var progressCache = [];

function Init()
{


    if(config.progressBarType == 0)
    {
        //Start single progressbar.
        document.querySelector('.yeet').style.left = '0%';

        setInterval(UpdateSingle, 250);
    }
}

//Update the single progressbar.
function UpdateSingle()
{
    UpdateTotalProgress();

	document.querySelector('.yeet').style.width = progressCache[10] + '%';
	

}

// Update the total percentage loaded (above the progressbar on the right).
function UpdateTotalProgress()
{
        //Set the total progress counter:
        var total = GetTotalProgress();
        var totalProgress = document.getElementById("progress-bar-value");
    
        if(progressCache[10] != null)
        {
            total = Math.max(total, progressCache[10]);
        }
        
        totalProgress.innerHTML = Math.round(total);
        progressCache[10] = total;
}
