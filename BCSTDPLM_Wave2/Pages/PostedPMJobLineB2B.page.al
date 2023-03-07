page 33000915 "Posted PM Job Line B2B"
{

    Caption = 'Posted PM Job Line';
    DelayedInsert = true;
    Editable = false;
    PageType = ListPart;
    SourceTable = "PM Job Line B2B";
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Sl. No."; Rec."Sl. No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Sl No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Description.';
                }
                field("Component ID"; Rec."Component ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Component ID.';
                    Visible = false;
                }
                field("Component Name"; Rec."Component Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Component Name.';
                    Visible = false;
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Frequency name.';
                    Editable = false;
                }
                field("Maintenace Type Name"; Rec."Maintenace Type Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Maintenance type name.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Start date.';
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Next due date.';
                }
                field("Hrs Required"; Rec."Hrs Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Hours required.';
                }
                field(Observations; Rec.Observations)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines observations.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Status.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Remarks.';
                }
            }
        }
    }

    actions
    {
    }
}

