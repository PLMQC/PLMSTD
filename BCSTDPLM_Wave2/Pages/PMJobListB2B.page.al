page 33000913 "PM Job List B2B"
{

    Caption = 'PM Job List';
    CardPageID = "PM Job Card B2B";
    Editable = false;
    PageType = List;
    SourceTable = "PM Job Header B2B";
    SourceTableView = WHERE(Posted = CONST(false),
                            Type = CONST(PMR));
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Job card No.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine No.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine name.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Frequency type.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the type of the job card.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the created date.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the created by user.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup2)
            {
                Caption = 'Print';
                action(Print)
                {
                    Caption = 'Print';
                    PromotedOnly = true;
                    ApplicationArea = all;
                    ToolTip = 'It Defines Print Option.';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        PMJobHeaderGRec.RESET();
                        PMJobHeaderGRec.SETRANGE("No.", Rec."No.");
                        REPORT.RUNMODAL(33000906, GUIALLOWED(), false, PMJobHeaderGRec)
                    end;
                }
            }
        }
    }

    var
        PMJobHeaderGRec: Record "PM Job Header B2B";
}

