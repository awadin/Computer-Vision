%Returns the homography matrix for the given points!
%It is hard coded according to the lecture 20 notes
function h = buildHomog(p1, p2, p3, p4, c1, c2, c3, c4)
vec1 = [p1(1), p1(2), 1, 0, 0, 0, -c1(1)*p1(1), -c1(1)*p1(2), -c1(1)];
vec2 = [0,0,0,p1(1), p1(2), 1, -c1(2)*p1(1), -c1(2)*p1(2), -c1(2)];

vec3 = [p2(1), p2(2), 1, 0, 0, 0, -c2(1)*p2(1), -c2(1)*p2(2), -c2(1)];
vec4 = [0,0,0,p2(1), p2(2), 1, -c2(2)*p2(1), -c1(2)*p2(2), -c2(2)];

vec5 = [p3(1), p3(2), 1, 0, 0, 0, -c3(1)*p3(1), -c1(1)*p3(2), -c3(1)];
vec6 = [0,0,0,p3(1), p3(2), 1, -c3(2)*p3(1), -c1(2)*p3(2), -c3(2)];

vec7 = [p4(1), p4(2), 1, 0, 0, 0, -c4(1)*p4(1), -c1(1)*p4(2), -c4(1)];
vec8 = [0,0,0,p4(1), p4(2), 1, -c4(2)*p4(1), -c1(2)*p4(2), -c4(2)];

h = [vec1;vec2;vec3;vec4;vec5;vec6;vec7;vec8];

end