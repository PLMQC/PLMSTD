page 33000912 "PM Job Line B2B"
{
    Caption = 'PM Job Line';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "PM Job Line B2B";

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
                    Visible = false;
                }
                field("Frequency ID"; Rec."Frequency ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Frequency ID.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Frequnecy Name.';
                }
                field("Check List Id"; Rec."Check List Id")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Check list ID.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Check list Description.';
                    Visible = false;
                }
                field("Component ID"; Rec."Component ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Component ID.';
                    Visible = false;
                }
                field("Component Name"; Rec."Component Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Component name.';
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Start date.';
                    Editable = false;
                    Visible = true;
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Actual Start date.';
                    Visible = false;
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Next Due Date.';
                    Editable = false;
                    Visible = true;
                }
                field("Hrs Required"; Rec."Hrs Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Hrs.';
                    Editable = false;
                }
                field("Planned Total Cost"; Rec."Planned Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Planned total cost.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Amount.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Status.';
                }
                field(Observations; Rec.Observations)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Observations.';
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
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Procedure")
                {
                    Caption = 'Procedure';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Procedure.';
                    Image = AddWatch;

                    trigger OnAction();
                    begin
                        _ShowJobLineProcedures();
                    end;
                }
            }
            group("PM &Job")
            {
                Caption = 'PM &Job';
                action(Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Comments.';
                    Image = Comment;

                    trigger OnAction();
                    begin
                        ShowComments();
                    end;
                }
            }
        }
    }

    var

    procedure ShowOperationParticulars();
    begin
    end;

    procedure ShowComments();
    begin
        Rec.ShowLineComments();
    end;

    procedure _ShowJobLineProcedures();
    var
        JobLineProcLRec: Record "Job Card  Line Procedure B2B";
    begin
        JobLineProcLRec.RESET();
        JobLineProcLRec.SETRANGE("Job Card No.", Rec."Job Header No.");
        JobLineProcLRec.SETRANGE("Machine ID", Rec."Machine ID");
        JobLineProcLRec.SETRANGE("Job Card  Line No.", Rec."Line No.");
        PAGE.RUNMODAL(33000926, JobLineProcLRec);
    end;

    procedure ShowJobLineProcedures();
    var
        JobLineProcLRec: Record "Job Card  Line Procedure B2B";
    begin
        JobLineProcLRec.RESET();
        JobLineProcLRec.SETRANGE("Job Card No.", Rec."Job Header No.");
        JobLineProcLRec.SETRANGE("Machine ID", Rec."Machine ID");
        JobLineProcLRec.SETRANGE("Job Card  Line No.", Rec."Line No.");
        PAGE.RUNMODAL(33000926, JobLineProcLRec);
    end;

    procedure OtherPlannedWorksheet();
    begin
        Rec.PlannedWorksheet();
    end;
}

