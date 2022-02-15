function [coordinates, labels, charging_places] = getStations()

    labels = {
        'Sation1';
        'Sation2';
        'Sation3';
        'Sation4';
        'Sation5';
        'Sation6';
        'Sation7';
        'Sation8';
        'Sation9';
        'Sation10';
    };

    coordinates = [
        [24 46];
        [55 37];
        [90 44];
        [50 67];
        [60 75];
        [30 30];
        [90 30];
        [80 65];
        [59 18];
        [18 66];
    ];

    charging_places = [
        3
        2
        4
        3
        3
        2
        3
        4
        4
        2
    ];
end
