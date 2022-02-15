function busy = createBusyList(chargingPlaces)
    statLen = length(chargingPlaces);
    busy = zeros(statLen, statLen);
    for i=1:statLen
        for j=1:statLen
            busy(i, j) = chargingPlaces(i);
        end
    end
end