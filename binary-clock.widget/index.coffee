# Created by Joel Eisner 2/08/16
# Modified by Diskutant 

# 12 Hour Format: "date +%-I,%M,%-S"
# 24 Hour Format: "date +%-H,%M,%-S"
command: "date +%-I,%M,%-S"

# Refresh every second
refreshFrequency: 1000

# Create the DOM
render: () -> """
    <div class="container">
        <div class="col col-1">
            <div class="row row-1"></div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
            <div class="row row-5">
                <div class="dot"></div>
            </div>
            <div class="row row-6">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-2">
            <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
            <div class="row row-5">
                <div class="dot"></div>
            </div>
            <div class="row row-6">
                <div class="dot"></div>
            </div>
        </div>
        <div class="col col-3">
               <div class="row row-1">
                <div class="dot"></div>
            </div>
            <div class="row row-2">
                <div class="dot"></div>
            </div>
            <div class="row row-3">
                <div class="dot"></div>
            </div>
            <div class="row row-4">
                <div class="dot"></div>
            </div>
            <div class="row row-5">
                <div class="dot"></div>
            </div>
            <div class="row row-6">
                <div class="dot"></div>
            </div>
        </div>
    </div>
"""

update: (output, domEl) ->
    time = output.split(',')
    hours = parseInt time[0]
    minutes = parseInt time[1]
    seconds = parseInt time[2]
    
    # Fill dots function
    fillDots = (el, num) ->
        el.find('.dot').removeClass 'fill'
        if num >= 32
            el.find('.row-1').find('.dot').addClass 'fill'
            num-=32
        if num >=16
            el.find('.row-2').find('.dot').addClass 'fill'
            num-=16
        if num >=8
            el.find('.row-3').find('.dot').addClass 'fill'
            num-=8
        if num >=4
            el.find('.row-4').find('.dot').addClass 'fill'
            num-=4
        if num >=2
            el.find('.row-5').find('.dot').addClass 'fill'
            num-=2
        if num is 1
            el.find('.row-6').find('.dot').addClass 'fill'
       
    fillDots($('.col-1'), hours)
    fillDots($('.col-2'), minutes)
    fillDots($('.col-3'), seconds)

# Basic Style to center output
style: """
    bottom:190px;
    left:10px;
    
    * {
        box-sizing:border-box;
    }
    .col {
        float:left;
        width:40px;
        height:160px;
    }
    .row {
        position:relative;
        width:40px;
        height:40px;
    }
    .dot {
        position:absolute;
        top:50%;
        left:50%;
        margin-top:-10px;
        margin-left:-10px;
        width:20px;
        height:20px;
        border-radius:100%;
        border:2px solid rgba(255,255,255,0.7);
    }
    .dot.fill {
        border:none;
        background-color:rgba(255,255,255,0.7);
    }
"""
