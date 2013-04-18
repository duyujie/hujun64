function CascadeCheckmarks(e)
{
    // obj gives us the node on which check or uncheck operation has performed
    var element = e.srcElement || e.target; 
    var parentState = true; //default true;
    
    //checking whether obj consists of checkbox to avoid exception
    if (isCheckBox(element))
    {
        var checkedState = element.checked;
        
        //work our way back to the parent <li> element 
        while (!isListItem(element))
            element = element.parentNode;
        recurseThroughChildren(element.firstChild, checkedState); //set child nodes to checkedState
        
        //from the <li> work our way back to the parent <ul> element 
        while (!isList(element))
            element = element.parentNode;
        recurseThroughParents(element, parentState); //set parent nodes accordingly
    }
}

function recurseThroughChildren(element, checkedState)
{
    var chkbox;
    while(!isNull(element))
    {
        //mark the child checkbox the same as the parent
        chkbox = getCheckBox(element);
        if (!isNull(chkbox))
            chkbox.checked = checkedState;
        //recurse through children of current element
        recurseThroughChildren(element.firstChild, checkedState);
        element = element.nextSibling;
    }
}

function recurseThroughParents(parent, parentState)
{
    //if it is an unorderd list, process children
    if(isList(parent))
    { 
        //get all child elements that are list items
        var item = parent.getElementsByTagName('LI')[0];
        var chkbox;
        
        //foreach list item...
        while(!isNull(item))
        {
            //whle the children are not check boxes (only 1 checkbox per list item)
            chkbox = getCheckBox(item.firstChild)
            if ((!isNull(chkbox)) && (!chkbox.checked))
                parentState = false;
            item = item.nextSibling;
        }
        if (!isDiv(parent.parentNode))
        {
            var parentCheckBox = getCheckBox(parent.parentNode);
            if (!isNull(parentCheckBox))
                parentCheckBox.checked = parentState;
        }
    }
    if (!isDiv(parent)) //if it is not a div tag countinue to the next parent
        recurseThroughParents(parent.parentNode, parentState);
}

//return the first checkbox found
function getCheckBox(obj)
{
    var ret = null;
    while (!isNull(obj))
    {
        if (isCheckBox(obj))
            ret = obj;
        else if (obj.childNodes.length > 0)
            ret = getCheckBox(obj.firstChild);
        if (isCheckBox(ret))
            break;
        obj = obj.nextSibling;
    }
    return ret;
}


//helper functions
function isDiv(obj)
{
    if (isNull(obj))
        return false;
    return (obj.tagName == 'DIV');
}

function isCheckBox(obj)
{
    if (isNull(obj))
        return false;
    return (obj.tagName == 'INPUT' && obj.type == 'checkbox');
}

function isList(obj)
{
    if (isNull(obj))
        return false;
    return (obj.tagName == 'UL');
}

function isListItem(obj)
{
    if (isNull(obj))
        return false;
    return (obj.tagName == 'LI');
}

function isNull(obj)
{
    return (obj == null);
}

