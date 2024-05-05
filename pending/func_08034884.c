#include "bm.h"
#include "unit.h"

int IsUnitCurrentMainLord(struct Unit * unit)
{
    int unit_value;
    int mode_value;

    switch (unit->pinfo->id)
    {
        case 3:
            unit_value = 1;
            break;

        case 1:
            unit_value = 2;
            break;

        case 2:
            unit_value = 3;
            break;

        default:
            unit_value = 0;
            break;
    }

    switch (gPlayStatus.scenario)
    {
        case 1:
            mode_value = 1;
            break;

        case 2:
            mode_value = 2;
            break;

        case 3:
            mode_value = 3;
            break;

        default:
            mode_value = 4;
            break;
    }

    return unit_value == mode_value;
}
