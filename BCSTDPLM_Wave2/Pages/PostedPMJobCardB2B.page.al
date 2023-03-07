page 33000914 "Posted PM Job Card B2B"
{

    Caption = 'Posted PM Job Card';
    UsageCategory = History;
    ApplicationArea = all;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "PM Job Header B2B";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the General Details.';
                    Editable = false;
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine No Details.';
                    Editable = false;
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine name Details.';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Type.';
                    Editable = false;
                }
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the COmplaint No  Details.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Frequency name Details.';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Start date and time Details.';
                    Editable = false;
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the End date and time Details.';
                    Editable = false;
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Time Details.';
                    Visible = false;
                }
                field("Total Minutes"; Rec."Total Minutes")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Duration Details.';
                    Editable = false;
                }
            }
            part(Control1102154008; "PM Job Line B2B")
            {
                ApplicationArea = all;
                Editable = false;
                SubPageLink = "Job Header No." = FIELD("No."),
                              "Machine ID" = FIELD("Machine ID");
            }
            group(Details)
            {
                Caption = 'Details';
                field("Expected Resource Cost"; Rec."Expected Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Expected Resource cost Details.';
                }
                field("Expected Spares Cost"; Rec."Expected Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Expected Spares cost Details.';
                }
                field("Actual Resource Cost"; Rec."Actual Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Actual Resource cost Details.';
                }
                field("Actual Spares Cost"; Rec."Actual Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Expected Spares cost Details.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the total cost Details.';
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Plant ID Details.';
                }
                field(Originator; Rec.Originator)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Originator Details.';
                }
                field("Contact Man"; Rec."Contact Man")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Contact person Details.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("PM &Job")
            {
                Caption = 'PM &Job';
                action("Work Sheet")
                {
                    Caption = 'Work Sheet';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Worksheet Details.';
                    Image = Worksheet;
                    RunObject = Page "Posted Work Sheet B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
                action("Planned Worksheet")
                {
                    Caption = 'Planned Worksheet';
                    ToolTip = 'It Defines the Planned worksheet Details.';
                    ApplicationArea = all;
                    Image = PlanningWorksheet;
                    RunObject = Page "PM Job OP Particulars B2B";
                    RunPageLink = "Job Card No." = FIELD("No.");
                }
                action("Procedure")
                {
                    Caption = 'Procedure';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Procedure Details.';
                    Image = AddWatch;
                    RunObject = Page "Job Card Procedure List B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
                action("Safety Information")
                {
                    Caption = 'Safety Information';
                    ToolTip = 'It Defines the Safety info Details.';
                    ApplicationArea = all;
                    Image = Info;
                    RunObject = Page "Posted  Safety Info B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Comments.';
                    Image = ViewComments;
                    RunObject = Page "Posted PLM Comment Sheet B2B";
                    RunPageLink = "No." = FIELD("No.");
                }
            }
        }
    }

    var

}

